
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

## ref
+ [深入解析 Kubebuilder：让编写 CRD 变得更简单](https://juejin.im/post/6844903952241131534)
