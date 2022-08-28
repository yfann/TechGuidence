## schema
+ GVK->Go type映射

+ API包中定义了`AddToScheme` 用于注册Scheme
```go
// main.go
	_ = clientgoscheme.AddToScheme(scheme)

	_ = hscphilipscomv1.AddToScheme(scheme)

	_ = v1beta1.AddToScheme(scheme)
```
+ Scheme中的每个GVK都会在Cache中创建对应的Informer

+ To add a 3rd party resource to an operator, you must add it to the Manager’s scheme.
	+ Call the AddToScheme() function for your 3rd party resource and pass it the Manager’s scheme via mgr.GetScheme() or scheme in main.go
```go
import (
    cachev1alpha1 "github.com/example-inc/memcached-operator/api/v1alpha1
    ...
)

func init() {

    // Setup Scheme for all resources
    utilruntime.Must(cachev1alpha1.AddToScheme(scheme))
    // +kubebuilder:scaffold:scheme
}
```

+  If 3rd party resource does not have AddToScheme() function
```go

import (
    ...
    "k8s.io/apimachinery/pkg/runtime/schema"
    "sigs.k8s.io/controller-runtime/pkg/scheme"
    ...
    // DNSEndoints
    externaldns "github.com/kubernetes-incubator/external-dns/endpoint"
    metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
 )

func init() {
    ...

    log.Info("Registering Components.")

    schemeBuilder := &scheme.Builder{GroupVersion: schema.GroupVersion{Group: "externaldns.k8s.io", Version: "v1alpha1"}}
    schemeBuilder.Register(&externaldns.DNSEndpoint{}, &externaldns.DNSEndpointList{})
    if err := schemeBuilder.AddToScheme(mgr.GetScheme()); err != nil {
        log.Error(err, "")
        os.Exit(1)
    }

    ...
}
```


## ref

+ [Adding 3rd Party Resources To Your Operator](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/)

+ [SchemeBuilder](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/scheme#Builder)
<!-- api -->
+ [core](https://godoc.org/k8s.io/api/core/v1)

<!-- sample -->
+ [creat SchemeBuilder](https://github.com/kubernetes/api/blob/master/apps/v1/register.go#L41)