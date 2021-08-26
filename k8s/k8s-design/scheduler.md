# k8s scheduler

+ 只负责调度pod到node上

+ 后续kubelet 负责pod的执行

## 调度算法

+ Predicates
    + 过滤算法，排除不可用的Node

+ Priorities
    + 排出可用Node的优先顺序

+ 只考虑pod resource.requests
    + 不考虑limits
    + initContainer取最大
    + Containers取总和
    + 两者取最大

## k8s高级调度方法


+ 不经过scheduler调度
    + pod 选择 node
        + 直接指定nodeName
        + nodeSelctor
        + nodeAffinity
        + podAffinity
    + node 选择 pod
        + taints
        + tolerations
    + pod node 一对一
        + nodeAffinity + taints

## tips

+ topologykey
    + node如果同一个key

## test
+ `docker ps` 登录master节点后，查看各个组件

+ `kubectl get po -o wide`
    + `kubectl get po xxx -o yaml >xx.yaml`

+ `kubectl explain pod --recursive|grep affinity -A22`

+ `kubectl get pod <scheduler-pod> -n kube-system -o yaml?new-scheduler.yaml`
    + 改yaml中 --scheduler-name=<new-name>
    + 创建个新的scheduler
    + Pod.Spec.schedulerName指定scheduler
## ref

