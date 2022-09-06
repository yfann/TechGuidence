# operator

## Operator Framework
+ operator SDK
+ Operator lifecycle Manager
+ Operatror metering


## RateLimit

+ return err,或 return result{Requeue:true}
    + `c.Queue.AddRateLimited(req)`
+ 设置了RequeueAfter
    + `c.Queue.AddAfter(req, result.RequeueAfter)`

+ exponential backoff
    + `baseDelay*2^<num-failures>`

+ MaxOfRateLimiter
    + maxDelay(delay不超过maxDelay)

+ ItemExponentialFailureRateLimiter
    + 每个item,随着失败次数delay指数增长

+ BucketRateLimiter
    + token bucket algorithm 

+ golang.org/x/time/rate 

## tips

+ metrics collection for operator
    + Kubernetes Audit Logs
        + kubeprovenance 

+ support for kube openapi:`+k8s:openapi-gen=true`

+ watch
    + `c.Watch(&source.Kind{Type: &v1.Deployment{}}, &handler.Funcs{}, getPredicateFuncs())`

+ RateLimiter 
    + workqueue

+ *metav1.Time
    + 定义CRD的Time字段

## ref

<!-- design -->
+ [Kubernetes Operator Development Guidelines for improved Usability](https://itnext.io/kubernetes-operator-development-guidelines-for-improved-usability-222390b00dc4)
+ [Kubernetes Operator Maturity Model](https://github.com/cloud-ark/kubeplus/blob/master/Guidelines.md)
+ [kubernetes/kube-openapi](https://github.com/kubernetes/kube-openapi)

<!-- ratelimiter -->
+ [RATE LIMITING IN CONTROLLER-RUNTIME AND CLIENT-GO](https://danielmangum.com/posts/controller-runtime-client-go-rate-limiting/)
+ [token bucket令牌桶限流算法原理及代码](https://blog.51cto.com/u_11440114/3021408?xiangguantuijian&01)

<!-- practice -->
+ [A complete guide to Kubernetes Operator SDK](https://banzaicloud.com/blog/operator-sdk/)
+ [Building an Kubernetes Operator for Prometheus and Thanos](https://robszumski.com/building-an-operator/)


<!-- samples -->
+ [coreos/etcd-operator](https://github.com/coreos/etcd-operator)
+ [oracle/mysql-operator](https://github.com/oracle/mysql-operator/blob/master/pkg/resources/services/service.go#L34)
+ [robszumski/prometheus-replica-operator](https://github.com/robszumski/prometheus-replica-operator/blob/master/pkg/stub/handler.go#L32)
+ [](https://github.com/lyft/flinkk8soperator/blob/b5eb19657df91782e51028019e89a7c1badd30d1/pkg/controller/flinkapplication/controller.go)


<!-- tools -->
+ [kube-reporting/metering-operator](https://github.com/kube-reporting/metering-operator)