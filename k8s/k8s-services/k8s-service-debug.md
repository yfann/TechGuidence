## Node IP
+ 物理机IP/虚拟机IP
+ 每个Service都会在Node上开通一个端口
    + 外部通过 NodeIP:NodePort访问service
+ `kubectl describe node <nodeName>` 查看IP
    + InternalIP

## Pod IP
+ Docker Engine根据docker网桥的IP地址段分配,虚拟二层网络
+ 同Service下的Pod根据PodIP相互通信
    + 不同Service下的Pod，集群间pod通信用到Cluster IP
+ pod和集群外通信,要用到 Node IP
+ `kubectl describe pod <podName>`

## CLuster IP
+ Service IP,虚拟IP地址。集群内访问使用
    + 外部网络无法Ping通,没有实体网络响应
+ `kubectl describe svc <svcName>`



## tips
+ NodePort、LoadBalane、Ingress 三种方式暴露服务给外部使用


## cmd
+ `kubectl get svc`



## 本地调试pod内部
+ `kubectl port-forward <resource> <local port>:<resource port>`
    + `kubectl port-forward pods/redis-master-765d459796-258hz 7000:6379`
    + `kubectl port-forward svc/redis-master 7000:redis`
    + 转发本地请求到Pod服务器
    + 只能TCP


## 本地调试k8s api server
+ `kubectl proxy  [--port=8080]`  用代理访问kubernetes API
    + `curl http://localhost:8080/api/`



## debug
+ `kubectl exec kubia-7nog1 -- curl -s http://10.111.249.153`
  + `curl http://kubia.default.svc.cluster.local`
  + `curl http://kubia.default`
  + `curl http://kubia`
+ `kubectl exec <pod-name> env`
+ `kubectl exec -it <pod-name> -- /bin/sh`
  + `cat /etc/resolv.conf` 查看pod配置

<!-- Pod是否可以通过DNS name访问service -->
+ `nslookup <service-name>` 
  + `nslookup <service-name>.<namespace>` 如果运行命令的pod和service不在同一个namespace
+ `cat /etc/resolv.conf`
<!-- Pod中是否可以通过IP访问service -->
+ `wget -qO- 172.21.4.97:8200`
<!-- 查看service配置 -->
+ `kubectl get service <service name> -o json`
<!-- 查看endpoints -->
+ `kubectl get endpoints <service name>`


## ref
+ [调试service](https://kubernetes.io/zh/docs/tasks/debug-application-cluster/debug-service/)
+ [使用端口转发来访问集群中的应用](https://kubernetes.io/zh/docs/tasks/access-application-cluster/port-forward-access-application-cluster/)