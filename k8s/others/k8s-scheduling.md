
## tips
+ RuntimeClass
    + 指定 CPU/Memory
+ Limit CPU/memory
    + 超过limit memory会out of memory
    + 如果没设reqeust CPU/memory, k8s会自动把limit设为reqeust

+ Compute resources
    + CPU
    + memory

+ API resources
    + Pods
    + Services

+ priority

+ nodeSelector

+ Affinity 

+ kube-scheduler
    + 过滤
    + 打分

## ref
+ [调度和驱逐 (Scheduling and Eviction)](https://kubernetes.io/zh/docs/concepts/scheduling-eviction/)


+ [Pod 优先级与抢占](https://kubernetes.io/zh/docs/concepts/configuration/pod-priority-preemption/)

<!-- cpu memory -->
+ [Pod Overhead](https://kubernetes.io/docs/concepts/scheduling-eviction/pod-overhead/)
+ [Managing Resources for Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
+ [为容器和 Pods 分配 CPU 资源](https://kubernetes.io/zh/docs/tasks/configure-pod-container/assign-cpu-resource/)
+ [为容器和 Pod 分配内存资源](https://kubernetes.io/zh/docs/tasks/configure-pod-container/assign-memory-resource/)

<!-- pod to node -->
+ [将 Pod 分配给节点](https://kubernetes.io/zh/docs/concepts/scheduling-eviction/assign-pod-node/)
+ [污点和容忍度](https://kubernetes.io/zh/docs/concepts/scheduling-eviction/taint-and-toleration/)

<!-- 调度 -->
+ [Kubernetes 调度器](https://kubernetes.io/zh/docs/concepts/scheduling-eviction/kube-scheduler/)
+ [调度策略](https://kubernetes.io/zh/docs/reference/scheduling/policies/)



<!-- ali -->
+ [通过resource-controller组件动态修改Pod资源上限](https://help.aliyun.com/document_detail/197267.html?spm=a2c4g.11186623.2.9.26e657f5jyf5OO)