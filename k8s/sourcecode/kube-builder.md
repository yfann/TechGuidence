
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

## trigger reconcile 
+ watch impementations
```go
func (r *VcapServicesConverterReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&hscphilipscomv1.VcapServicesConverter{}).
		Watches(&source.Kind{Type: &corev1.Secret{}}, &handler.EnqueueRequestForObject{}).
		Complete(r)
}
```

+ manager each x time
<!-- Options struct
SyncPeriod *time.Duration -->


## ref
+ [深入解析 Kubebuilder：让编写 CRD 变得更简单](https://juejin.im/post/6844903952241131534)
+ [kubebuilder2.0学习笔记——进阶使用](https://segmentfault.com/a/1190000020359577)