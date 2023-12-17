

## does not contain package k8s.io/api/auditregistration/v1alpha1

+ 使所有`k8s.io\...`的版本一致
```go
require (
    ...
    k8s.io/api v0.19.0
    k8s.io/apimachinery v0.19.0
    k8s.io/client-go v0.19.0
    ...
)
```


## others
+ 有些库可能还在dep下运行,需要关闭go module