
## control plane(master nodeß)
+ etcd
    + 乐观锁（ metadata.resourceVersion）
    + RAFT 
    + 奇数个实例(分成两半后其中多数的一方可以更新state)
+ API server
    + store resources in etcd and notify chients about the change
    + 操作etcd的唯一入口
    + request->Authentications->Authorizations->Admission controls
        + Admission Control会修改资源，添加或修改字段
    + request如果只是获取数据,不会经过Admission controls
    + clients 通过HTTP connection watch资源
        + 如果资源发生变化，API server会发送新版本的资源到HTTP connection到clients
        + clients包括kubectl,control plane components

+ Scheduler 
    + wait new pod through the API server's watch mechanism
    + assign a node to new pod
    + update the pod definition throught API server for scheduled pod
    + scheduling algorithm
        + filter nodes which the pods can be scheduled to
        + Prioritizing the acceptable nodes
    + pod can set schedulerName(pod is scheduled using a named Scheduler)

+ Controller Manager
    + controller
        + controller之间不知道彼此的存在只和API server交互
        + make resources' actual state towards the desired state(reconciliation)
        + watch the API server for changes to resources
        + run a reconciliation loop
            + reconciles the actual state with the desired state,writes the actual state to the resource's status section




## worker node
+ kubelete 只能运行在system上，其他component可以运行在pod上
    + responsible for everything running on a worker node
    + monitor running contianers
    + run liveness probes
        + restart containers when i't fail

+ kube-proxy
    + userspace proxy
        + client---------iptables---------->kube-proxy-->pod
            + round-robin
    + iptable proxy
        + client-------iptables----->pod
            + randomly

## add-ons
+ enable feature
+ deployed as pods
    + deploy by Deployment,RC,DaemonSet

+ DNS add-on
    + pods use the cluster's internal DNS server by default
    + exposed by kube-dns service


## kubectl create a deployment
1. kubectl post deployment to API server
2. Deployment controller 通过API server watch到了新创建的资源，创建ReplicaSets
3. ReplicaSet controller watch到了新的resource, 开始创建pods
4. Scheduler watch到新的pods， 为他们挑选合适的nodes，设置pods的nodeName
5. 对应node上的kubelet 通过API server watch到pods的调度信息，构建docker(container),运行pod的container

## cluster events

+ control plane components and kubelet emit events to API server as they perform actions
    + create event resources
    + `kubectl describe pods`
    + `kubectl get events`

## running pod

+ pause container(Infrastructure container) 
    + ssh to a worker node
        + `docker ps`
            + list pause container
    + holds all contianers in a pod(hold all linux namespaces)
    + lifecycle is tied to the pod
+ pod network
    + each pod has a IP
    + pod can communicate with each other(无论是否在同一个worker node
    + NAT-less communication between pods
        + 发送的packet的IP不用改
        + pod to pod
        + pod to node
    + pod to internet
        + pod 发送的packet的IP(私有IP,pod IP)要换成host worker node的IP

+ virtual Ethernet interface pair (a veth pair)
    + vethXXX in host's namespace
        + attached to a network bridge that the container runtime is configured to use
    + eth0 in container's network namespace
        + assigned an IP address from the bridge’s address range
        + node 的网络出口
    + app(in container)-->eth0-->vethxxx--->bridge-->received by any network interface connecd to the bridge
        + pod A's veth pair--->bridge-->pod b's veth pair
    + 同一个node中的container连接着同一个bridge
    + `ifconfig` on the node

+ nodes comunication
    + pod IP在cluster中唯一
    + plain layer 3 networking
        + physical network
        + Routing table
    + 不同node的bridge要保证不同node 中pod IP不会冲突
        +  non-overlapping address 
            + bridge1 10.1.1.0/24
            + bridge2 10.1.2.0/24
    + same network switch
        + pod A's veth pair-->node A bridge-->node A physical adapter--->node B physical adapter--->node B bridge--->container B veth pair
    + Software Defined Network (SDN)
        + 看起来像在同一个network switch

## Container Network Interface (CNI)
+ To make it easier to connect containers into a network
    + Calico
    + Flannel
    + Romanna


## kube-proxy
+ kube-proxy process running on each node 
    + userspace proxy mode
    + iptables proxy mode
+ service IP is virtual
    + can't ping
+ iptables
    + kube-proxy uses iptables to make service available on each node
        + each packet destined for the sservice IP----->intercepted(modified dest address)--> pods backing the service
    + kube-proxy watch services
+ endpoints
    + holds IP/port pairs for pods backing the service
    + kube-proxy watch endpoints

+ packet(dest: service IP)------>kube-proxy(iptables,endpoints)---->packet(dest: pod IP)

## cmd
+ `kubectl get componentstatuses`
+ `kubectl attach`
    + 类似于`kubectl exec`, `kubectl attach`会attach到container的main process而不是单独启动一个
+ `kubectl get po -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system`
<!-- etcd -->
+ `etcdctl ls /registry/pods/default`  etcd中的key是个directory，可以看到内部的key
    + `etcdctl get /registry --prefix=true` etcd version3 不支持文件夹作为key，可以做为前缀
+ `etcdctl get /registry/pods/default/kubia-159041347-wt6ga`
<!-- API server -->
+ `kubectl get pods --watch`



## development on k8s

### pod's lifecycle

+ apps in a pod can be killed and relocated
    + run app in a new pod
    + pod的IP会变
    + statefulSet的hostname不会变
    + 写在container filesystem上的文件会丢失（be killed,restarted ...）
        + 可以写在volumn上
            + volumn的生命周期随pod
    + RS controller doesn't reschedule dead pods

+ start pods in order
    + init container
        + writing data-->volumn-->mount to main container
        + can delay the start of main container
```yaml
spec:
  initContainers:                                                        
  - name: init
    image: busybox
    command:
    - sh
    - -c
    - 'while true; do echo "Waiting for fortune service to come up...";  
      wget http://fortune -q -T 1 -O /dev/null >/dev/null 2>/dev/null   
      && break; sleep 1; done; echo "Service is up! Starting main       
      container."'
```

+ readiness prob
    + affect app is added as sevice endpoint
    + also deployment controller performs a rolling update

+ lifecycle hooks(per container)
    + post-start hooks(when container starts)
    + pre-stop hooks(before container stops)

## tips
+ CrashLoopBackOff
    + kubelet is delaying the restart because the container keeps crashing

+ 安装有依赖的k8s resource时(获取不到依赖时，重试直到依赖资源ready)
    + deployment(依赖secret)
        + deployment先创建
        + 取不到secret时，pod会创建失败
        + 然后重试
        + 直到servicebinding创建成功后能获取到secret
    + servicebinding(创建secret)

## ref
+ [admission controllers](https://kubernetes.io/docs/admin/admission-controllers/)
+ [CNI](https://kubernetes.io/docs/concepts/cluster-administration/addons/)

<!-- cases -->
+ [helm安装deployment，servicebinding顺序不对时为何不会失败](https://stackoverflow.com/questions/63472047/helm-3-deployment-order-of-kubernetes-service-catalog-resources)