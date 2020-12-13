# Controller Runtime

+ 被kube-builer,operator-sdk使用
+ includes a client that uses the Go types presented in “Anatomy of a type”.
    + this client is one instance, capable of handling any kind that is registered in a given scheme.
    + 类似于Dynamic Client
    + It uses discovery information from the API server to map the kinds to HTTP paths
    + 需要传入runtime.Object


## controller runtime

```go
import (
    "flag"

    corev1 "k8s.io/api/core/v1"
    metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
    "k8s.io/client-go/kubernetes/scheme"
    "k8s.io/client-go/tools/clientcmd"

    runtimeclient "sigs.k8s.io/controller-runtime/pkg/client"
)

kubeconfig = flag.String("kubeconfig", "~/.kube/config", "kubeconfig file path")
flag.Parse()
config, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)

cl, _ := runtimeclient.New(config, client.Options{
    // borrowed from client-go with all standard Kubernetes kinds being registered
    Scheme: scheme.Scheme,
})
// runtime.Object对象
podList := &corev1.PodList{}
err := cl.List(context.TODO(), client.InNamespace("default"), podList)
```


```go
//注册cr的scheme
crScheme := runtime.NewScheme()
cnatv1alpha1.AddToScheme(crScheme)

cl, _ := runtimeclient.New(config, client.Options{
    Scheme: crScheme,
})
list := &cnatv1alpha1.AtList{}
err := cl.List(context.TODO(), client.InNamespace("default"), list)
```