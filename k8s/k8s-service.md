
## services
+ enabling clients to discover and talk to pods
+ exposing groups of pods to other pods in the cluster
+ process TCP,UDP level,not HTTP level

## tips
```yaml
apiVersion: v1
kind: Service
metadata:
  name: kubia
spec:
  # 同一个pod每次响应同一个客户端
  sessionAffinity: ClientIP 
  ports:
  - port: 80                
    targetPort: 8080        
  selector:                 
    app: kubia 

# You’re defining a service called kubia, which will accept connections on port 80 and route each connection to port 8080 of one of the pods matching the app=kubia label selector.
```
+ port
    - port: service 暴露出的port
    - targetPort: contain port

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

+ 使用命名端口
```yaml
  ports:
  - name: http             
    port: 80               
    targetPort: http 
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
      + set clusterIP: None
        + 则 返回pod IPs
```yaml
apiVersion: v1
kind: Service
metadata:
  name: kubia-headless
spec:
  clusterIP: None                ❶
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: kubia
```
  +  ❶ makes service headless

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

+ ExternalName(指向external service,out of cluster)
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
  + 每个load balancer都需要个IP
  + Ingerss只需要一个IP,可以转发所有services(根据request的host,path决定)
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

## testing
+ `kubectl exec kubia-7nog1 -- curl -s http://10.111.249.153`
  + `curl http://kubia.default.svc.cluster.local`
  + `curl http://kubia.default`
  + `curl http://kubia`
+ `kubectl exec kubia-3inly env`
+ `kubectl exec -it kubia-3inly bash`
  + `cat /etc/resolv.conf` 查看pod配置

## ref
+ [服务、负载均衡和联网](https://kubernetes.io/zh/docs/concepts/services-networking/)