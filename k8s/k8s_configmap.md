

## cmd

+ `kubectl create configmap <map-name> <data-source>`
    - `<data-srouce>` key value
    - `kubectl describe/get`
    - `kubectl create configmap game-config --from-file=configure-pod-container/configmap/`

## ref
+ [使用 ConfigMap 配置 Pod](https://kubernetes.io/zh/docs/tasks/configure-pod-container/configure-pod-configmap/)

+ [K8s 集群使用 ConfigMap 优雅加载 Spring Boot 配置文件](https://cloud.tencent.com/developer/article/1433236)
+ [Configuring Spring Boot on Kubernetes with ConfigMap](https://developers.redhat.com/blog/2017/10/03/configuring-spring-boot-kubernetes-configmap/)
+ [Configuring Redis using a ConfigMap](https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/)