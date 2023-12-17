# API Server

## HTTP Interface

+ JSON/protobuf (payload) for cluster-internal communication

+ Kind 
    + Kinds are the types of objects returned by and received by these endpoints, as well as persisted into etcd.

+ API group
    - A collection of Kinds that are logically related
    - GVK

+ Version
    - v1alpha1->v1beta1->v1

+ Resource
    + Resources correspond to HTTP paths.
    + GVR
        + uniquely defines an HTTP path
            + /apis/<group>/<version>/namespaces/<namespace>/<resource>
                - `/apis/batch/v1/namespaces/$NAMESPACE/jobs`

+ core
    + api/v1

+ not resource aligned api
    + /metrics
    + /logs
    + /healthz
    + ?watch=true

+ State
    + spec
        + desired state
        + stored in etcd
    + observed state

## request to API server
+ HTTP request is processed by a chain of filters registered in DefaultBuildHandlerChain()
    + k8s.io/apiserver/pkg/server/config.go
    + Either the filter passes and attaches respective information to the context—to be precise, ctx.RequestInfo
+ multiplexer routes the HTTP request to the respective handler.
    + k8s.io/apiserver/pkg/server/handler.go

+ A handler is registered for each API group
    + k8s.io/apiserver/pkg/endpoints/groupversion.go
    + k8s.io/apiserver/pkg/endpoints/installer.go

## debug
+ `kubectl -n kube-system get deploy/coredns -o=yaml`
+ `kubectl proxy --port=8080`
    + `curl http://127.0.0.1:8080/apis/batch/v1`
    + `kubectl get --raw /apis/batch/v1`
+ `kubectl api-resources`
+ `kubectl api-versions`

## ref
+ [Kubernetes API Concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/#efficient-detection-of-changes)