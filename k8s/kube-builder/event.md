## events
+ Events are produced by Sources assigned to resources a controller is watching. These events are transformed into Requests by EventHandlers and passed to Reconcile().

+ 包含source的metadata
```go
type UpdateEvent struct {
  // MetaOld is the ObjectMeta of the Kubernetes Type that was updated (before the update).
  MetaOld v1.Object

  // ObjectOld is the object from the event.
  ObjectOld runtime.Object

  // MetaNew is the ObjectMeta of the Kubernetes Type that was updated (after the update).
  MetaNew v1.Object

  // ObjectNew is the object from the event.
  ObjectNew runtime.Object
}
```

## Predicates
+ Predicates allow controllers to filter events before they are provided to EventHandlers

```go
// Predicate filters events before enqueuing the keys.
type Predicate interface {
  Create(event.CreateEvent) bool
  Delete(event.DeleteEvent) bool
  Update(event.UpdateEvent) bool
  Generic(event.GenericEvent) bool
}

// Funcs implements Predicate.
// return true if the event should be processed by Reconcile()
type Funcs struct {
// For example, all Create events for any watched resource will be passed to Funcs.Create() and filtered out if the method evaluates to false.
  CreateFunc func(event.CreateEvent) bool
  DeleteFunc func(event.DeleteEvent) bool
  UpdateFunc func(event.UpdateEvent) bool
  GenericFunc func(event.GenericEvent) bool
}
```


+ 使用predicates
```go
import (
	"context"

	"github.com/go-logr/logr"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	ctrl "sigs.k8s.io/controller-runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/event"
	"sigs.k8s.io/controller-runtime/pkg/predicate"

	cachev1alpha1 "github.com/example-inc/app-operator/apis/cache/v1alpha1"
)

...

func ignoreDeletionPredicate() predicate.Predicate {
	return predicate.Funcs{
		UpdateFunc: func(e event.UpdateEvent) bool {
			// Ignore updates to CR status in which case metadata.Generation does not change
			return e.MetaOld.GetGeneration() != e.MetaNew.GetGeneration()
		},
		DeleteFunc: func(e event.DeleteEvent) bool {
			// Evaluates to false if the object has been confirmed deleted.
			return !e.DeleteStateUnknown
		},
	}
}

func (r *MemcachedReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&cachev1alpha1.Memcached{}).
		Owns(&corev1.Pod{}).
		WithEventFilter(ignoreDeletionPredicate()).
		Complete(r)
}
  ...
}
```

## ref
+ [Using Predicates for Event Filtering with Operator SDK](https://sdk.operatorframework.io/docs/building-operators/golang/references/event-filtering/)

<!-- source code -->
+ [event](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/event)
+ [source](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/source#Source)
+ [Eventhandler](https://godoc.org/sigs.k8s.io/controller-runtime/pkg/handler#EventHandler)
+ [predicate](https://godoc.org/github.com/kubernetes-sigs/controller-runtime/pkg/predicate)
+ [metadata](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#Object)