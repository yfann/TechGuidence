
## default client

+ client.Client is managed by manager.Manager
```go
import ctrl "sigs.k8s.io/controller-runtime"

func (r *KindReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&cachev1alpha1.Kind{}).
		Owns(&appsv1.Deployment{}).
		Complete(r)
}

type KindReconciler struct {
    // Populated above from a manager.Manager  by default.
    client.Client
    Log    logr.Logger
    Scheme *runtime.Scheme
}
```

+ A  client reads (Get and List) from the Cache and writes (Create, Update, Delete) to the API server. 

## Non-default Client

+ 创建自定义client(例如：直接读API不经过缓存)

```go
// New returns a new Client using the provided config and Options.
func New(config *rest.Config, options client.Options) (client.Client, error)

// Options are creation options for a Client
type Options struct {
    // Scheme, if provided, will be used to map go structs to GroupVersionKinds
    // 需要加入CRD的scheme
    Scheme *runtime.Scheme

    // Mapper, if provided, will be used to map GroupVersionKinds to Resources
    Mapper meta.RESTMapper
}

// example

import (
    "sigs.k8s.io/controller-runtime/pkg/client/config"
    "sigs.k8s.io/controller-runtime/pkg/client"
)

cfg, err := config.GetConfig()
// ...
c, err := client.New(cfg, client.Options{})
// ...
```

## ref

+ [controller runtime client](https://sdk.operatorframework.io/docs/building-operators/golang/references/client/)
+ [client](https://godoc.org/github.com/kubernetes-sigs/controller-runtime/pkg/client#DelegatingClient)