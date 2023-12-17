# API Machinery

+ k8s.io/apimachinery

+ go type---(schema)--->GVK---(rest mapping)-->GVR------->http endpoint

+ implements the basics of the Kubernetes type system

+ 包含代码片段用于实现 Kubernetes-like API
    + 也可以实现与k8s无关的API例如： build APIs for online shop

+ k8s.io/apimachinery/pkg/apis/meta/v1（API machinery features）
    + ObjectMeta
    + TypeMeta
    + GetOptions
    + ListOptions

## kind

+  CamelCase

+ GroupVersionKind(GVK)
    + Kinds are divided into API groups and are versioned
    + each GVK corresponds to one Go type
        + a Go type can belong to multiple GVKs

+ 多数kind有HTTP REST endpoints
    + 少数例外（admission.k8s.io/v1beta1.AdmissionReview）


## Resources

+ owercase and plural
    + DNS path label format
+ GroupVersionResource(GVR)
+ 都有HTTP path,REST endpoints 
    + GVR apps/v1.deployments maps to /apis/apps/v1/namespaces/namespace/deployments
    + Client 用http path 去访问GVR


## REST Mapping

+ mapping from GVK to GVR

```go
RESTMapping(gk schema.GroupKind, versions ...string) (*RESTMapping, error)

type RESTMapping struct {
    // Resource is the GroupVersionResource (location) for this endpoint.
    Resource schema.GroupVersionResource.

    // GroupVersionKind is the GroupVersionKind (data format) to submit
    // to this endpoint.
    GroupVersionKind schema.GroupVersionKind

    // Scope contains the information needed to deal with REST Resources
    // that are in a resource hierarchy.
    Scope RESTScope
}
```

+  DeferredDiscoveryRESTMapper(k8s.io/client-go/restmapper)
    + it uses discovery information from the Kubernetes API server to dynamically build up the REST mapping
    + 支持non-core resource(CR)


## Scheme
+ k8s.io/apimachinery/pkg/runtime
+ mapping go type to GVK
```go
func (s *Scheme) ObjectKinds(obj Object) ([]schema.GroupVersionKind, bool, error)
```

+ 注册go type(reflect.Type)
```go
// scheme反射传入的object拿到go type,然后映射到GVK
scheme.AddKnownTypes(schema.GroupVersionKind{"", "v1", "Pod"}, &Pod{})
```

+ conversion functions

+ defaulters


+ core type(k8s.io/client-go/kubernetes/scheme)
    + client set includes