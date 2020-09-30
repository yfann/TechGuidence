```go
appsv1 "k8s.io/api/apps/v1"
corev1 "k8s.io/api/core/v1"
"k8s.io/apimachinery/pkg/api/errors"
metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
utilruntime "k8s.io/apimachinery/pkg/util/runtime"
"k8s.io/apimachinery/pkg/util/wait"
appsinformers "k8s.io/client-go/informers/apps/v1"
"k8s.io/client-go/kubernetes"
"k8s.io/client-go/kubernetes/scheme"
typedcorev1 "k8s.io/client-go/kubernetes/typed/core/v1"
appslisters "k8s.io/client-go/listers/apps/v1"
"k8s.io/client-go/tools/cache"
"k8s.io/client-go/tools/record"
"k8s.io/client-go/util/workqueue"
"k8s.io/klog/v2"
```

## ref
+ [k8s.io/api/apps/v1](https://pkg.go.dev/k8s.io/api/apps/v1#ControllerRevision)
+ [k8s.io/api/core/v1](https://pkg.go.dev/k8s.io/api/core/v1#pkg-overview)