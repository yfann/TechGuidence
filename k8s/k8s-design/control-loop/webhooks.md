

# admission webhooks

+ Admission webhooks are HTTP callbacks that receive admission requests, process them and return admission responses.

+ processing sequence
    + mutating admission webhook-------> API server validating ---------> validating admission webhooks

+ flow chart
```
   ┌──────────────────────────────┐                               ┌───────────────────┐
   │                              │◄───AdmissionReview Request────┤                   │
   │   Admission webhook server   │                               │     Apiservers    │
   │                              ├─────AdmissionReview obj──────►│                   │
   └──────────────────────────────┘                               └───────────────────┘



                   +-------------------------------------------+
                   |Api server                                 |
                   |                                           |
                   | +---------+ +------+ +-------+ +--------+ |
                   | | admission |Validate|admission| storage| |
+-----Request----->+ |         | |      | |       | |        | |
                   | +-+--+----+ +------+ +-+-^---+ +---+--^-+ |
                   |   |  ^                 | |         |  |   |
                   +-------------------------------------------+
                       |  |                 | |         |  |
                       v  |                 v |         v  |
                     +-+--+------+  +-------+-+-+    +--+--+-+
                     | Mutating  |  | validating|    |  etcd |
                     | webhooks  |  | Webhooks  |    |       |
                     +-----------+  +-----------+    +-------+

```


## Mutating Admission Webhook
+ 在对象存储前，可以设置default value
+ inject sidecar container


## Validating Admission Webhook
+ 在对象存储前，可以validating
    + schema-based validation
    + pod image whitelisting
    + auth

+ `+kubebuilder:validation`
    + validate OpenAPI schema

+ `controller-gen crd -w`
    + get markers


## AdmissionReview
+ AdmissionRequest
    + Object(runtime.RawExtension)
+ AdmissionRespone
    + Mutation webhook返回的结果可包含patch,patchType fields
        + 去更改API server中的obj
        + JSON patch

## admission controller

+ An admission controller is a piece of code that intercepts requests to the Kubernetes API server prior to persistence of the object, but after the request is authenticated and authorized.

## ref
<!-- admission webhooks -->
+ [Admission Webhooks](https://sdk.operatorframework.io/docs/building-operators/golang/webhook/)
+ [Implementing defaulting/validating webhooks](https://book.kubebuilder.io/cronjob-tutorial/webhook-implementation.html)
+ [programming kubernetes:Admission Webhooks](https://learning.oreilly.com/library/view/programming-kubernetes/9781492047094/ch09.html#idm46336842288408)
+ [深入理解 Kubernetes Admission Webhook](https://www.qikqiak.com/post/k8s-admission-webhook/)

<!-- admission controller -->
+ [Using Admission Controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
+ [Dynamic Admission Control](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/#authenticate-apiservers)


<!-- core type example -->
+ [Admission Webhook for Core Types](https://book.kubebuilder.io/reference/webhook-for-core-types.html)
+ [admission webhooks for core types example](https://github.com/kubernetes-sigs/controller-runtime/tree/master/examples/builtins)
    + kubebuilder doesn’t support webhook scaffolding for core types
    + `sigs.k8s.io/controller-runtime/pkg/webhook/admission`



<!-- others -->
+ [CRD Validation markers](https://book.kubebuilder.io/reference/markers/crd-validation.html)


