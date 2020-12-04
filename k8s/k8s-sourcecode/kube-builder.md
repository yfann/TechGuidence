


## manager
```go
// The Manager can restrict the namespace that all controllers will watch for resources:
mgr, err := ctrl.NewManager(cfg, manager.Options{Namespace: namespace})
// To watch all namespaces leave the namespace option empty:
mgr, err := ctrl.NewManager(cfg, manager.Options{Namespace: ""})

var namespaces []string // List of Namespaces
// Create a new Cmd to provide shared dependencies and start components
mgr, err := ctrl.NewManager(cfg, manager.Options{
   NewCache: cache.MultiNamespacedCacheBuilder(namespaces),
})
```


```go
// NewControllerManagedBy() 返回controller builder

// For(&cachev1alpha1.Memcached{})   Memcached作为被watch的主资源，任何 ADD/update/delete 都
// 会触发reconcile request(a namespace/name key)

// Owns(&appsv1.Deployment{}) secondary resource。 任何 Add/Update/Delete event,event handler
// 都会为他的owner映射成 reconcile request
func (r *MemcachedReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&cachev1alpha1.Memcached{}).
		Owns(&appsv1.Deployment{}).
		Complete(r)
}
```

```go
...
namespaces := []string{"foo", "bar"} // List of Namespaces
...
mgr, err := ctrl.NewManager(ctrl.GetConfigOrDie(), ctrl.Options{
    Scheme:             scheme,
    MetricsBindAddress: metricsAddr,
    Port:               9443,
    LeaderElection:     enableLeaderElection, 
    LeaderElectionID:   "f1c5ece8.example.com",
    NewCache:           cache.MultiNamespacedCacheBuilder(namespaces),
})
...
```

## ref
+ [深入解析 Kubebuilder：让编写 CRD 变得更简单](https://juejin.im/post/6844903952241131534)
+ [operator sdk](https://sdk.operatorframework.io/docs/building-operators/golang/tutorial/)
+ [EventHandlers](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/handler#hdr-EventHandlers)
+ [builder](https://godoc.org/github.com/kubernetes-sigs/controller-runtime/pkg/builder#example-Builder)
+ [controller](https://godoc.org/github.com/kubernetes-sigs/controller-runtime/pkg/controller)





<!-- sample code -->
+ [create a SchemeBuilder](https://github.com/kubernetes/api/blob/master/apps/v1/register.go#L41)