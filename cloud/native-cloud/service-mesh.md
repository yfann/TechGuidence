# service mesh

+ A service mesh is a tool for adding observability, security, and reliability features to applications(micro services) by inserting these features at the platform layer rather than the application layer.

+ control plane
    + data plane
        +  network proxy(sidecar)
            + communication between micro services

+ end-to-end performance, reliability, and securitys

+ handling service-to-service communication
    + containers
        + application isolation
        + sidecar for service mesh(runtime)
            + rather than  library approach(compile time)
    + k8s

+ 从service代码层剥离，通过sidecar注入
    + 服务发现
    + 路由
    + 限流，熔断
        + circuit breaking
        + retry budgets
        + rate limiting
    + 监控
    

+ 管理集群内部service间的流量

## tips
+ Istio

+ Linkerd
    + dynamic routing
    + connection pool
    + failure retry
    + monitor,metrics

+ microservice communication layer
    + Finagle
    + Hystrix
    + Proxygen
    + Ribbon

## ref
+ [ServiceMesher](https://www.servicemesher.com/)
+ [什么是 Service Mesh](https://zhuanlan.zhihu.com/p/61901608)
+ [What's a service mesh? And why do I need one?](https://buoyant.io/what-is-a-service-mesh)
+ [The Service Mesh: What Every Software Engineer Needs to Know about the World's Most Over-Hyped Technology](https://buoyant.io/service-mesh-manifesto/)
+ [Pattern: Service Mesh](https://philcalcado.com/2017/08/03/pattern_service_mesh.html)


<!-- details -->
+ [服务网格（Service Mesh ）教程](https://jimmysong.io/kubernetes-handbook/usecases/service-mesh.html)