
## context
+ 简化请求在多个goroutine间的切换
+ 每个reqeust都有一个goroutine处理
    + 可能会创建额外的goroutine
    + 多个goroutine处理一个request
    + 如果request超时，则所有的goroutine都应该被终止



## imports
+ io
+ log
+ time
+ net

## tips

+ reflect.DeepEqual
    + func类型都为nil时相等，其他不相等
```go
Array1 := []string{"hello1", "hello2"}
Array2 := []string{"hello1", "hello2"}

fmt.Println(reflect.DeepEqual(Array1, Array2))
// true
```

## ref
+ [查找Go包](https://pkg.go.dev/)



<!-- pkg -->
+ [fmt](https://golang.org/pkg/fmt/ )
+ [Marshal json](https://blog.golang.org/json)
+ [Package base64](https://golang.org/pkg/encoding/base64/#example_Encoding_EncodeToString)
+ [Package reflect](https://golang.org/pkg/reflect/)
+ [context](https://juejin.im/post/6844903555145400334)
+ [text/template](https://juejin.im/post/6844903762901860360)
+ [html/template](https://golang.org/pkg/html/template/)


<!-- 3rd pkg -->
+ [viper](https://github.com/spf13/viper)
    + configuration solution for Go application
+ [kelseyhightower/envconfig](https://github.com/kelseyhightower/envconfig)
    + get environment variables to struct
+ [errors](github.com/pkg/errors)
    + add context to the failure path
+ [glog](github.com/golang/glog)



<!-- k8s -->
+ [package v1beta1](https://pkg.go.dev/github.com/kubernetes-sigs/service-catalog/pkg/apis/servicecatalog/v1beta1)
+ [Package controllerruntime](https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.6.3)
+ [kubernetes-sigs/go-open-service-broker-client](https://github.com/kubernetes-sigs/go-open-service-broker-client/tree/master/docs)
+ [k8s.io/apimachinery/pkg/types](https://pkg.go.dev/k8s.io/apimachinery/pkg/types)
+ [brokerapi](https://github.com/pivotal-cf/brokerapi)