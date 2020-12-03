
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



## context 
+ allow cancelation of requests
+ tracing

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

## ref
+ [深入解析 Kubebuilder：让编写 CRD 变得更简单](https://juejin.im/post/6844903952241131534)
