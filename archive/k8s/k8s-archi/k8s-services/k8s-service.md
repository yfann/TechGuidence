

##  service type
+ ClusterIP：默认类型，自动分配一个仅 cluster 内部可以访问的虚拟 IP
  + k8s内部访问
  + k8s之外的ECS访问，要通过SLB暴露内网IP
  + 是虚拟ip, ping不通

+ NodePort：在 ClusterIP 基础上为 Service 在每台机器上绑定一个端口，这样就可以通过 <NodeIP>:NodePort 来访问该服务。如果 kube-proxy 设置了 --nodeport-addresses=10.240.0.0/16（v1.10 支持），那么仅该 NodePort 仅对设置在范围内的 IP 有效。
  + 可以外部访问

+ LoadBalancer：在 NodePort 的基础上，借助 cloud provider 创建一个外部的负载均衡器，并将请求转发到 <NodeIP>:NodePort
  + 需要云供应商提供支持

+ ExternalName：将服务通过 DNS CNAME 记录方式转发到指定的域名（通过 spec.externlName 设定）。需要 kube-dns 版本在 1.7 以上。
  + 可以指向另一个service
  + CNAME

## tips

+ port
    - port: service 暴露出的port
    - targetPort: container port

+ label selector to connect pods

+ multi ports, 多端口需要指定名字
```yaml
ports:
  - name: http              
    port: 80                
    targetPort: 8080        
  - name: https             
    port: 443               
    targetPort: 8443        
```

+ pod selector
  + 设置pod selector后，service会自动创建internal endpoints指向pods
  + 不设置pod selector,service不会自动创建internal endpoints，可以手动创建external endpoints,使service指向external service

+ service type
  + CLusterIP(集群内访问)
  + LoadBalancer(暴露给集群外部)

+ services在connection level
  + curl每次会建立新的connection
  + browser使用keep-alive connection
    - 只要connection不关闭，每次请求都会到达同一个pod,即使session affinity为None

+ externalTrafficPolicy，使接收请求的pod只发生在接收connection的Node上
  + 没有可用pod,会挂起
  + pod可以获取client IP，因为没有发生SNAT
```yaml
spec:
  externalTrafficPolicy: Local
```

+ pod添加label enabled=true ,service 更加label选择pods,删除pod上的label可以把pod从service中删除


+ cluster IP
  + 是虚拟ip, ping不通
  + DNS lookup 
    + 会返回service的cluster IP
      + `clusterIP: None`
        + 则返回pod IPs
        + headless


## cluster中使用services

+ 新创建的pod,环境变量会注入先前的service
  + `kubectl exec kubia-3inly env`
    + `kubectl get svc`查到的svc会已环境变量的形式注入到新建的pod中
      + xxx-xx->XXX_XX

+ kube-dns
  + dnsPolicy in pod's spec
  + `<service-name>.<namespace>.svc.cluster.local`
    + `backend-database.default.svc.cluster.local`

## endpoints(cluster中使用external service)
```yaml
apiVersion: v1
kind: Endpoints
metadata:
  name: external-service      ❶
subsets:
  - addresses:
    - ip: 11.11.11.11         ❷
    - ip: 22.22.22.22         ❷
    ports:
    - port: 80                ❸
```
+ ❶名字要和service的名字一致
+ ❷The IPs of the endpoints that the service will forward connections to：pod->service->external ip
+ `kubectl get endpoints <service-name>`
+ service中配置了pod selector会创建endpoints
+ endpoint controller会watch service 和 pod的变化
  + 把pod selector对应的pods的IP 加入到endpoints的list中

## ExternalName(指向external service,out of cluster)
- DNS层的CNAME实现
- 没有cluster IP
```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-service
spec:
  type: ExternalName                         ❶
  externalName: someapi.somecompany.com      ❷
  ports:
  - port: 80
```

## external client使用cluster中的service

+ NodePort service
```yaml
apiVersion: v1
kind: Service
metadata:
  name: kubia-nodeport
spec:
  type: NodePort             ❶
  ports:
  - port: 80                 ❷
    targetPort: 8080         ❸
    nodePort: 30123          ❹
  selector:
    app: kubia
```
  - ❷ This is the port of the service’s internal cluster IP.
  - ❸ This is the target port of the backing pods.
  - ❹ The service will be accessible through port 30123 of each of your cluster nodes.
  - accessable
    + <node's IP>:30123
    + cluster-IP:80
  - get nodes ip
    + ` kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'`


+ external load balancer
  - has EXTERNAL-IP 
  - node port的扩展
    - external client->load balancer->node port->service->behind pod
  - pod获取不到client IP,Source Network Address Translation (SNAT)(处理请求的pod有可能不在接收connection的Node上，会发生additional network hop )
```yaml
spec:
  type: LoadBalancer 
```

+ Ingress
  + 每个load balancer都需要个IP.Ingerss只需要一个IP,可以转发所有services(根据request的host,path决定)
  + ingress controller 运行反向代理(Nginx)
    + Ingress controller forward traffic to ther service's pod directly instead of going throught the service IP
      + 这种方式获取不到client IP
  + 工作在application level,可以cookie-based sessio affinity(service不可以)
  + `kubectl get po --all-namespaces` ingress controller 是否开启
  + `kubectl get ingresses` 查看域名的ingress controller IP
  + 配置DNS解析域名->ingress controller IP
    + 或client添加`/etc/hosts`,`C:\windows\system32\drivers\etc\hosts`
      + 192.168.99.100    kubia.example.com
  + `curl http://kubia.example.com`
  + external client->DNS查询(解析域名为ingress controller IP)或hosts解析->ingress controller->pod(根据配置查询pod的ip services->endpoints->pods)
  + exernal client---TLS--->ingress controller----HTTP--->pods
```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubia
spec:
  rules:
  - host: kubia.example.com               ❶
    http:
      paths:
      - path: /                           ❷
        backend:
          serviceName: kubia-nodeport     ❷
          servicePort: 80                 ❷
```


## readiness probes
+ 决定Pod什么时候可以接受请求
+ exec probe
+ HTTP Get probe
+ TCP Socket probe
+ ready的Pods会加入到service的endpoints中，如果不设置readiness probes pod会立即添加到service的endpoints中(如果pod启动过长无法接受请求，会发生`Connection refused`错误)
+ `kubectl edit rc kubia`
```yaml
apiVersion: v1
kind: ReplicationController
...
spec:
  ...
  template:
    ...
    spec:
      containers:
      - name: kubia
        image: luksa/kubia
        readinessProbe:           ❶
          exec:                   ❶
            command:              ❶
            - ls                  ❶
            - /var/ready          ❶
        ...
```
  + ❶ 命令会周期性的执行（10s），The ls command returns exit code zero if the file exists,


## service trouble shooting
+ service's cluster IP只能在cluster内部连
+ 如果定义了readiness probe则检查是否成功
+ 如果FQDN(myservice.mynamespace.svc.cluster.local)访问不通,则检查cluster IP是否可以连通
+ 检查是否连接的service的port,而不是target port
+ 查看pod IP:port是否能连



## ref
+ [service](https://kubernetes.io/docs/concepts/services-networking/service/)
+ [服务、负载均衡和联网](https://kubernetes.io/zh/docs/concepts/services-networking/)
+ [使用 Service 连接到应用](https://kubernetes.io/zh/docs/concepts/services-networking/connect-applications-service/)
+ [服务发现与负载均衡](https://feisky.gitbooks.io/kubernetes/content/concepts/service.html)