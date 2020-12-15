
## Kubernetes API Types
+ k8s.io/api
+ k8s.io/api/core/v1(https://github.com/kubernetes/api/blob/master/core/v1/types.go)
    + pod
    + Service 




## creating client
```go
import (
    metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
    "k8s.io/client-go/tools/clientcmd"
    "k8s.io/client-go/kubernetes"
)

kubeconfig = flag.String("kubeconfig", "~/.kube/config", "kubeconfig file")
flag.Parse()
config, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)
clientset, err := kubernetes.NewForConfig(config)
// builder pattern
pod, err := clientset.CoreV1().Pods("book").Get("example", metav1.GetOptions{})
```

+ rest.Config
    - k8s中的pod运行binary的时候，kubelet mount service account on `/var/run/secrets/kubernetes.io/serviceaccount`
    - rest.InClusterConfig() 返回rest.Config
    - clientcmd.BuildConfigFromFlags 返回rest.Config

```go
// 生成rest.Config
config, err := rest.InClusterConfig()
if err != nil {
    // fallback to kubeconfig
    kubeconfig := filepath.Join("~", ".kube", "config")
    if envvar := os.Getenv("KUBECONFIG"); len(envvar) >0 {
        kubeconfig = envvar
    }
    config, err = clientcmd.BuildConfigFromFlags("", kubeconfig)
    if err != nil {
        fmt.Printf("The kubeconfig cannot be loaded: %v\n", err
        os.Exit(1)
    }
}
```


## Kubernetes objects
+ an object stores its type and allows cloning.
+ 实现runtime.Object 接口（ k8s.io/apimachinery/pkg/runtime）
```go
// Object interface must be supported by all API types registered with Scheme.
// Since objects in a scheme are expected to be serialized to the wire, the
// interface an Object must provide to the Scheme allows serializers to set
// the kind, version, and group the object is represented as. An Object may
// choose to return a no-op ObjectKindAccessor in cases where it is not
// expected to be serialized.
type Object interface {
    GetObjectKind() schema.ObjectKind
    DeepCopyObject() Object
}

// All objects that are serialized from a Scheme encode their type information.
// This interface is used by serialization to set type information from the
// Scheme onto the serialized version of an object. For objects that cannot
// be serialized or have unique requirements, this interface may be a no-op.
type ObjectKind interface {
    // SetGroupVersionKind sets or clears the intended serialized kind of an
    // object. Passing kind nil should clear the current setting.
    SetGroupVersionKind(kind GroupVersionKind)
    // GroupVersionKind returns the stored group, version, and kind of an
    // object, or nil if the object does not expose or provide these fields.
    GroupVersionKind() GroupVersionKind
}
```

+ TypeMeta实现了schema.ObjectKind
```go
type TypeMeta struct {
    Kind string `json:"kind,omitempty" protobuf:"bytes,1,opt,name=kind"`
    APIVersion string `json:"apiVersion,omitempty"`
}

type Pod struct {
    metav1.TypeMeta `json:",inline"`
    ...
}
```

+ ObjectMeta
    - name
    - namespace

+ spec(user desire) and status(outcome of the desire)



## client set
+ multiple clients
<!-- k8s.io/client-go/kubernetes -->
+ kubernetes.NewForConfig(config) 可以访问k8s.io/api中的resource
+ 都会用到rest.config
+ 方法都和version绑定(GroupVersion method),例如：AppsV1beta1()

<!-- k8s.io/apimachinery/pkg/watch -->
+ watches

## Client Options
```go
// change json to protobuf
cfg, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)
cfg.AcceptContentTypes = "application/vnd.kubernetes.protobuf,
                          application/json"
cfg.ContentType = "application/vnd.kubernetes.protobuf"
clientset, err := kubernetes.NewForConfig(cfg)

// for debug
cfg, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)
cfg.AcceptContentTypes = "application/vnd.kubernetes.protobuf,application/json"
cfg.UserAgent = fmt.Sprintf(
    "book-example/v1.0 (%s/%s) kubernetes/v1.0",
    runtime.GOOS, runtime.GOARCH
)
clientset, err := kubernetes.NewForConfig(cfg)
```

```go
// Config holds the common attributes that can be passed to a Kubernetes
// client on initialization.
type Config struct {
    ...

    // QPS indicates the maximum QPS to the master from this client.
    // If it's zero, the created RESTClient will use DefaultQPS: 5
    QPS float32

    // Maximum burst for throttle.
    // If it's zero, the created RESTClient will use DefaultBurst: 10.
    Burst int

    // The maximum length of time to wait before giving up on a server request.
    // A value of zero means no timeout.
    Timeout time.Duration

    ...
}
```

+ long-running reqeusts
    + watch
    + port-forward
    + exec
+ non-long-running reqeusts(API server 重启时会有60s gracefully shut down)
    + get
    + list
    + udpate

## sample-controller
+ The sample-controller uses the k8s.io/code-generator to generate a typed client, informers, listers, and deep-copy functions.
+ 任何改动如加新字段,都要用 update-codegen.sh重新生成
 <!-- implement our cnat operator using client-go, following the sample-controller  -->
+ `go get k8s.io/sample-controller`
+ sample-controller的内容copy到自己的文件夹中
+ `go build -o cnat-controller .`
+ `./cnat-controller -kubeconfig=$HOME/.kube/config`
    + launch the custom controller and wait for you to register the CRD and create a custom resource
+ ` kubectl apply -f artifacts/examples/crd.yaml`
+ `kubectl get crds`
+ rename pkg/apis/samplecontroller to pkg/apis/cnat
+ 修改types.go
+ 修改controller.go
+ `./hack/update-codegen.sh`
    + pkg/apis/cnat/v1alpha1/zz_generated.deepcopy.go
    + pkg/generated/*




+ code
```go
if when, err := c.syncHandler(key); err != nil {
    c.workqueue.AddRateLimited(key)
    return fmt.Errorf("error syncing '%s': %s, requeuing", key, err.Error())
} else if when != time.Duration(0) {
    c.workqueue.AddAfter(key, when)
} else {
    // Finally, if no error occurs we Forget this item so it does not
    // get queued again until another change happens.
    c.workqueue.Forget(obj)
}


// syncHandler compares the actual state with the desired state and attempts
// to converge the two. It then updates the Status block of the At resource
// with the current status of the resource. It returns how long to wait
// until the schedule is due.
func (c *Controller) syncHandler(key string) (time.Duration, error) {
    ...
}
```



## tips

+ `$HOME/.kube/config` k8s配置文件

+ support REST verb `watch`

+ go.mod中版本要一致******
    + `k8s.io/api`
    + `k8s.io/apimachinery`
    + `k8s.io/client-go`







## ref
+ [kubernetes/client-go](https://github.com/kubernetes/client-go/)
+ [client-go under the hood](https://github.com/kubernetes/sample-controller/blob/master/docs/controller-client-go.md)

+ [Installing client-go](https://github.com/kubernetes/client-go/blob/master/INSTALL.md)



<!-- book -->
+ [Basics of client-go](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch03.html#ch_client-go)

<!-- detail -->
+ [kubernetes 中 informer 的使用](https://www.jianshu.com/p/1e2e686fe363)
+ [client go使用及源码分析](https://www.huweihuang.com/article/source-analysis/client-go-source-analysis/)
+ [client-go 源码学习总结](https://zhuanlan.zhihu.com/p/202611841)

<!-- sample -->
+ [out-of-cluster-client-configuration](https://github.com/kubernetes/client-go/tree/master/examples/out-of-cluster-client-configuration)
+ [sample-controller](https://github.com/kubernetes/sample-controller)

<!-- source -->
+ [kubernetes/client-go](https://github.com/kubernetes/client-go)
+ [kubernetes/apimachinery](https://github.com/kubernetes/apimachinery/tree/master/pkg/apis/meta/v1)
+ [kubernetes/api](https://github.com/kubernetes/api)