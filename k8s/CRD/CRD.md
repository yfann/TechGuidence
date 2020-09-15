
## tips

+ 添加custom resources到k8s cluster(与built-in Kubernetes resources不同,like pod)的两种方式
    + CRD(CustomResourceDefinitions)
        + user can create new tyhpes of resources without adding another API server
        + 定义custom resources
        + Kubernetes API server会存储custom resources(不需要实现自己的APi server),存在etcd里
        + 没有API Aggregation 灵活
        + 不需要编程，CRD controller可以任何语言实现
        + using WebHooks do actions when creating,reading,updating...
        + 只支持CRUD
    + API Aggregation(AA)
        + like proxy
        + 需要实现自己的API Server,部署在pod中
        + API Aggregation会把请求转发到custom API Server
        + GO编写
        + 可以支持`exec`

+ Operator(enabling users to create, configure, and manage applications. Like Kubernetes's built-in resources)

## ref

+ [Custom Resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)

<!-- CustomResourceDefinitions -->
+ [Extend the Kubernetes API with CustomResourceDefinitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/)
+ [DNS subdomain name(Custom Resource 命名规范)](https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names)

<!-- API server aggregation -->
+ [Extending the Kubernetes API with the aggregation layer](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)

<!-- others -->
+ [Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
+ [Update API Objects in Place Using kubectl patch](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/)
+ [The Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
+ [k8s 认证授权](https://cloud.tencent.com/developer/article/1557565)
+ [Writing Controllers](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/controllers.md)

<!-- operator -->
+ [Introducing Operators: Putting Operational Knowledge into Software](https://coreos.com/blog/introducing-operators.html)

<!-- API -->
+ [Kubernetes API Reference(k8s obj spec format)](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#pod-v1-core)
+ [API Reference](https://kubernetes.io/docs/reference/kubernetes-api/)
+ [Client Libraries](https://kubernetes.io/docs/reference/using-api/client-libraries/)


<!-- code -->
+ [kubernetes/sample-controller](https://github.com/kubernetes/sample-controller)
+ [kubernetes/apiextensions-apiserver](https://github.com/kubernetes/apiextensions-apiserver/tree/master/examples/client-go)
+ [kubernetes/apiserver](https://github.com/kubernetes/apiserver)


<!-- TLDR -->
+ [API Conventions](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md)

