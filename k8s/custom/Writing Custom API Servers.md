# Writing Custom API servers

+ k8s.io/apiserver lib
    + k8s API server
    + custom API server
        + run in-cluster


## Options
+ coupled with flags
+ do not hold running data structure
+ be used during startup
+ convert to configuration or server objs running
    + Config()
+ RecommendedOptions.ApplyTo
    + apply flags
+ o.RecommendedOptions.SecureServing.MaybeDefaultWithSelfSignedCerts
    + 用户没有体统certificate时，则自签名self-signed certificate

## Config
+ contains runnable data structure
+ config are runtime obj
+ ExtraConfig
    + custom config
    + Complete() set default values
        + completedConfig
            + New() CustomServer


## CustomServer
+ PrepareRun()
+ POstStartHook


## run
+ etcd & go run . --etcd-servers localhost:2379 \
    --authentication-kubeconfig ~/.kube/config \
    --authorization-kubeconfig ~/.kube/config \
    --kubeconfig ~/.kube/config
+  curl -k https://localhost:443/healthz

## Internal Types
+ API server serves a number of resources and versions. 
+ Some resource have multiple versions
    +  API server converts between versions
        + Internal version(hub version)
+ request(v1)--->internal version(admission&validation)
+ conversion
    + 内部版本与外部版本之间相互转换
+ defaulting
    + 设置新加字段的默认值
+ roundtrippable
+ pkg/apis/<group-name>/types.go
    + internal type(hub type)
+ pkg/apis/<group-name>/<version>/types.go
    + external versions
+ SchemeGroupVersion(in register.go) refers runtime.APIVersionInternal
+ pkg/apis/group-name/install/install.go
    + install all versiona of an API gourp into a scheme
        + determine the default storage version of the resource

## Conversions
+ version的转换
+ pkg/apis/group-name/version/conversion.go
    + custom conversion
+ pkg/apis/group-name/version/zz_generated.conversion.go
    + conversion-gen
    + 需要知道所有的GroupVersionKinds
        + 依赖scheme builder
+ `func (s *Scheme) Convert(in, out interface{}, context interface{}) error`
    + out 可能会引用 in中的对象，修改out 可能会改变in
        + 如有必要在in和out间做deepcopy 

+ Generated code goes so far that the generator compares source and target structs and uses Golang’s unsafe packages to convert pointers to structs of the same memory layout via a simple type conversion

+ conversion.Scope
    + s.Meta().Context

## Defaulting

+ Defaulting is the step in an API request’s lifecycle that sets default values for omitted fields in incoming objects
    + restartPolicy: Always
+ only for external types, not internal types
+ pkg/apis/group-name/version/zz_generated.defaults.go
    + RegisterDefaults
```go
// 需要添加代码注册
func init() {
    localSchemeBuilder.Register(RegisterDefaults)
}
```
+ a pointer type must be used in the Golang API types
    + 例子：*bool 
        + 如果用户没有输入则为nil,而不是零值false
```go
//defaulting可以用来判断是否需要设置默认值
func SetDefaultsKind(obj *Type) {
    if obj.Foo == nil {
        x := true
        obj.Foo = &x
    }
}
```

+ roundtrippability
    + nil or empty maps/arrays
    + encoding and decoding bugs

## Validation
+ only for internal version
+ pkg/apis/group/validation

## Registry and Strategy

### GENERIC REGISTRY
+ REST logic 需要实现generic registry
    + 一般都是持久化对象

+ k8s.io/apiserver/pkg/registry/rest


## tips
+ pkg/apis/restaurant/install/roundtrip_test.go

## ref
+ [programming-kubernetes/pizza-apiserver](https://github.com/programming-kubernetes/pizza-apiserver)