## tips

+ CR设置了finalizer后,finalizer会阻止CR被删除,除非finalizer被清除

## code
```go
import (
    ...
    "sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"
)

const memcachedFinalizer = "finalizer.cache.example.com"

func (r *MemcachedReconciler) Reconcile(req ctrl.Request) (ctrl.Result, error) {
    ctx := context.Background()
    reqLogger := r.log.WithValues("memcached", req.NamespacedName)
    reqLogger.Info("Reconciling Memcached")

    // Fetch the Memcached instance
    memcached := &cachev1alpha1.Memcached{}
    err := r.Get(ctx, req.NamespacedName, memcached)
    if err != nil {
        if errors.IsNotFound(err) {
            // Request object not found, could have been deleted after reconcile request.
            // Owned objects are automatically garbage collected. For additional cleanup logic use finalizers.
            // Return and don't requeue
            reqLogger.Info("Memcached resource not found. Ignoring since object must be deleted.")
            return ctrl.Result{}, nil
        }
        // Error reading the object - requeue the request.
        reqLogger.Error(err, "Failed to get Memcached.")
        return ctrl.Result{}, err
    }

    ...

    // Check if the Memcached instance is marked to be deleted, which is
    // indicated by the deletion timestamp being set.
    isMemcachedMarkedToBeDeleted := memcached.GetDeletionTimestamp() != nil
    if isMemcachedMarkedToBeDeleted {
        if contains(memcached.GetFinalizers(), memcachedFinalizer) {
            // Run finalization logic for memcachedFinalizer. If the
            // finalization logic fails, don't remove the finalizer so
            // that we can retry during the next reconciliation.
            if err := r.finalizeMemcached(reqLogger, memcached); err != nil {
                return ctrl.Result{}, err
            }

            // Remove memcachedFinalizer. Once all finalizers have been
            // removed, the object will be deleted.
            controllerutil.RemoveFinalizer(memcached, memcachedFinalizer)
            err := r.Update(ctx, memcached)
            if err != nil {
                return ctrl.Result{}, err
            }
        }
        return ctrl.Result{}, nil
    }

    // Add finalizer for this CR
    if !contains(memcached.GetFinalizers(), memcachedFinalizer) {
        if err := r.addFinalizer(reqLogger, memcached); err != nil {
            return ctrl.Result{}, err
        }
    }

    ...

    return ctrl.Result{}, nil
}

func (r *MemcachedReconciler) finalizeMemcached(reqLogger logr.Logger, m *cachev1alpha1.Memcached) error {
    // TODO(user): Add the cleanup steps that the operator
    // needs to do before the CR can be deleted. Examples
    // of finalizers include performing backups and deleting
    // resources that are not owned by this CR, like a PVC.
    reqLogger.Info("Successfully finalized memcached")
    return nil
}

func (r *MemcachedReconciler) addFinalizer(reqLogger logr.Logger, m *cachev1alpha1.Memcached) error {
    reqLogger.Info("Adding Finalizer for the Memcached")
    controllerutil.AddFinalizer(m, memcachedFinalizer)

    // Update CR
    err := r.Update(context.TODO(), m)
    if err != nil {
        reqLogger.Error(err, "Failed to update Memcached with finalizer")
        return err
    }
    return nil
}

func contains(list []string, s string) bool {
    for _, v := range list {
        if v == s {
            return true
        }
    }
    return false
}
```

## ref
+ [official Kubernetes documentation on finalizers](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/#finalizers)