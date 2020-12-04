


## reconcile loop

+ The purpose of this function is to resolve the actual state of the system against the desired state requested by the resource.

+ should be idempotent
	+ prevent the creation of duplicate child
	+ Multiple calls to reconcile an unchanged resource must produce the same effect each time.
	+ 创建child resources时检查是否存在
	+ 查看child resources的spec是否和parent resource中的定义一致
	+ Reconciliation is not necessarily called for each change to the resource. It is possible that a single reconciliation may contain multiple changes. The Operator must be careful to ensure the entire state of the CR is represented by all of its child resources.
	+ Just because an Operator does not need to make changes during a reconciliation request doesn’t mean it doesn’t need to update the CR’s Status field. Depending on what values are captured in the CR’s status, it may make sense to update these even if the Operator determines it doesn’t need to make any changes to the existing resources.

+ `return reconcile.Result{}, nil`  not require another reconcile loop
+ `return reconcile.Result{}, err` requeue and try again
+ `return reconcile.Result{Requeue: true}, nil` requeue
+ `return reconcile.Result{RequeueAfter: time.Second*5}, nil` wait amount of time then requeue
	+ This approach is useful when there are multiple steps that must run serially, but may take some time to complete.

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

+ reconcile request(Namespace/Name) 用于查询资源

## code 

+ retrieve the primary resource that triggered the reconcile request

```go
// Fetch the VisitorsApp instance
instance := &examplev1.VisitorsApp{}
err := r.client.Get(context.TODO(), request.NamespacedName, instance) 12

if err != nil {
    if errors.IsNotFound(err) {
        return reconcile.Result{}, nil 3
    }
    // Error reading the object - requeue the request.
    return reconcile.Result{}, err
}
// update status
instance.Status.BackendImage = "example"
err := r.client.Status().Update(context.TODO(), instance)
```

+ Child Resoure creation
```go
found := &appsv1.Deployment{}
findMe := types.NamespacedName{
    Name:      "myDeployment",  1
    Namespace: instance.Namespace,  2
}
err := r.client.Get(context.TODO(), findMe, found)
if err != nil && errors.IsNotFound(err) {
    // Creation logic 3
}
```

+ Child Resource Deletion
	 + when Kubernetes deletes a resource, it still calls the Reconcile function. Kubernetes garbage collection is still performed, and the Operator will not be able to retrieve the primary resource.
```go
...
controllerutil.SetControllerReference(instance, dep, r.scheme)
```

+ finalizer
	+ A finalizer is simply a series of strings on a resource.
	+ If one or more finalizers are present on a resource, the `metadata.deletionTimestamp`field of the object is populated, signifying the end user’s desire to delete the resource. 
	+ Kubernetes will only perform the actual deletion once all of the finalizers are removed.
	+ Using this construct, you can block the garbage collection of a resource until the Operator has a chance to perform its own cleanup step. Once the Operator has finished with the necessary cleanup, it removes the finalizer, unblocking Kubernetes from performing its normal deletion steps.
```go
finalizer := "visitors.example.com"

beingDeleted := instance.GetDeletionTimestamp() != nil  1
if beingDeleted {
    if contains(instance.GetFinalizers(), finalizer) {

        // Perform finalization logic. If this fails, leave the finalizer
        // intact and requeue the reconcile request to attempt the clean
        // up again without allowing Kubernetes to actually delete
        // the resource.

		instance.SetFinalizers(remove(instance.GetFinalizers(), finalizer)) 
		// Once the cleanup tasks have finished, the Operator removes the finalizer so Kubernetes can continue with the resource cleanup.
        err := r.client.Update(context.TODO(), instance)
        if err != nil {
            return reconcile.Result{}, err
        }
    }
    return reconcile.Result{}, nil
}
```

## tips
+ 使用delay(数秒钟) 取检查API
+ reconcile中，如果有长时间操作. 先return,delay 触发reconcile 查看是否可以继续。而不是在reconcile中等待响应。
+ 如果操作大量资源，throttling the deployment requests 

## ref
+ [kubebuilder2.0学习笔记——进阶使用](https://segmentfault.com/a/1190000020359577)
+ [Package reconcile](https://pkg.go.dev/sigs.k8s.io/controller-runtime/pkg/reconcile)