


## reconcile loop

+ The purpose of this function is to resolve the actual state of the system against the desired state requested by the resource.

+ should be idempotent
	+ prevent the creation of duplicate child

+ 

+ builder 构建控制器的合法入口

+ triggered by watch impementations
```go
func (r *VcapServicesConverterReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&hscphilipscomv1.VcapServicesConverter{}).
		Watches(&source.Kind{Type: &corev1.Secret{}}, &handler.EnqueueRequestForObject{}).
		Complete(r)
}
```

+ triggered by manager each x time
<!-- Options struct
SyncPeriod *time.Duration -->

+ own,watch 可以用來监听其他资源
    + WithEventFilter  可以过滤watch的对象

+ Reconcile()
	+ return empty result and no error
		+ tell controller-runtime successfully reconciled and don't need to try again until there's some changes
		+ client.IgnoreNotFound(err)  忽略错误,不会requeue
		+ 会打印 Successfully Reconciled
    + return error
        + 会被log
        + reconciliation will be requeued
 

+ reconcile()中获取或操作其他资源要设置RBAC
<!-- // +kubebuilder:rbac:groups=deployment.hsc.philips.com.cn,resources=vcapservicesconverters/status,verbs=get;update;patch -->

## ref
+ [kubebuilder2.0学习笔记——进阶使用](https://segmentfault.com/a/1190000020359577)
+ [Package reconcile](https://pkg.go.dev/sigs.k8s.io/controller-runtime/pkg/reconcile)