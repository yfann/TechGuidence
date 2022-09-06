
## tips
+ Leader-with-lease
    + The leader pod periodically renews the leader lease and gives up leadership when it can’t renew the lease
    + split brain
```go
import (
    ...
    "sigs.k8s.io/controller-runtime/pkg/manager"
)

func main() {
    ...
    opts := manager.Options{
        ...
        LeaderElection: true,
        LeaderElectionID: "memcached-operator-lock"
    }
    mgr, err := manager.New(cfg, opts)
    ...
}
```
+ Leader-for-life
    + The leader pod only gives up leadership (via garbage collection) when it is deleted.
    + leader.Become()

## deug

+ 本地调试时需要设置LeaderElectionNamespace

## ref
+ [Leader election](https://sdk.operatorframework.io/docs/building-operators/golang/advanced-topics/#leader-election)
+ [leaderelection.go](https://github.com/kubernetes/client-go/blob/30b06a83d67458700a5378239df6b96948cb9160/tools/leaderelection/leaderelection.go#L21-L24)