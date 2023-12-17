
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
+ [Go 每日一库](https://darjun.github.io/)

<!-- pkg -->
+ [fmt](https://golang.org/pkg/fmt/ )
+ [Marshal json](https://blog.golang.org/json)
+ [Package base64](https://golang.org/pkg/encoding/base64/#example_Encoding_EncodeToString)
+ [Package reflect](https://golang.org/pkg/reflect/)
+ [context](https://juejin.im/post/6844903555145400334)
+ [text/template](https://juejin.im/post/6844903762901860360)
+ [html/template](https://golang.org/pkg/html/template/)

<!-- 3rd pkg -->

+ [kelseyhightower/envconfig](https://github.com/kelseyhightower/envconfig)
    + get environment variables to struct
+ [errors](github.com/pkg/errors)
    + add context to the failure path


<!-- k8s -->
+ [package v1beta1](https://pkg.go.dev/github.com/kubernetes-sigs/service-catalog/pkg/apis/servicecatalog/v1beta1)
+ [Package controllerruntime](https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.6.3)
+ [kubernetes-sigs/go-open-service-broker-client](https://github.com/kubernetes-sigs/go-open-service-broker-client/tree/master/docs)
+ [k8s.io/apimachinery/pkg/types](https://pkg.go.dev/k8s.io/apimachinery/pkg/types)
+ [brokerapi](https://github.com/pivotal-cf/brokerapi)

<!-- others -->
+ [fyne](https://juejin.cn/post/6868033438713118733)
    + 搭建个人博客
+ [buntdb](https://darjun.github.io/2020/03/21/godailylib/buntdb/)
    + 内存数据库
+ [govaluate](https://darjun.github.io/2020/04/01/godailylib/govaluate/)
    + 计算表达式
+ [plot ](https://darjun.github.io/2020/04/12/godailylib/plot/)
    + 绘图
+ [hey](https://github.com/rakyll/hey)
    + sends some load to a web application.
+ [depth](https://github.com/KyleBanks/depth)
    + Go source code dependency trees


<!-- 网络 -->
+ [GoPacket](https://github.com/google/gopacket)
    + 抓包
+ [gentleman](https://darjun.github.io/2020/04/07/godailylib/gentleman/)
    + http客户端
+ [negroni](https://darjun.github.io/2020/06/19/godailylib/negroni/)
    + http中间件
    + 添加日志或计算耗时
+ [net/rpc](https://darjun.github.io/2020/05/08/godailylib/rpc/)
+ [jsonrpc](https://darjun.github.io/2020/05/10/godailylib/jsonrpc/)
+ [twirp](https://darjun.github.io/2020/06/07/godailylib/twirp/)
    + protobuf

<!-- debug -->
+ [air](https://juejin.cn/post/6878852918586376205)
    + 热加载工具
+ [fsnotify](https://darjun.github.io/2020/01/19/godailylib/fsnotify/)
    + 文件修改自动加载
+ [godotenv](https://darjun.github.io/2020/02/12/godailylib/godotenv/)
    + .env文件读取内容，配置环境变量

<!-- log -->
+ [log](https://darjun.github.io/2020/02/07/godailylib/log/)
+ [glog](github.com/golang/glog)
    + [go-logr/logr](https://github.com/go-logr/logr)
+ [logrus](https://darjun.github.io/2020/02/07/godailylib/logrus/)
+ [zap](https://darjun.github.io/2020/04/23/godailylib/zap/)
    + 对性能和内存分配做了极致的优化

<!-- develop -->
+ [carbon](https://darjun.github.io/2020/02/14/godailylib/carbon/)
    + 日期处理
+ [watermill](https://darjun.github.io/2020/03/01/godailylib/watermill/)
    + 异步消息
+ [cast](https://darjun.github.io/2020/01/20/godailylib/cast/)
    + 类型转换
+ [dig](https://darjun.github.io/2020/02/22/godailylib/dig/)
    + 依赖注入
+ [jobrunner](https://juejin.cn/post/6867893228654313480)
+ [mapstructure](https://juejin.cn/post/6855300813707804686)
+ [mergo](https://darjun.github.io/2020/03/11/godailylib/mergo/)
    + 结构体map之间转换
+ [copier](https://darjun.github.io/2020/03/13/godailylib/copier/)
    + 不同结构体间赋值
+ [jennifer](https://darjun.github.io/2020/03/14/godailylib/jennifer/)
    + 代码生成
+ [go-cmp](https://darjun.github.io/2020/03/20/godailylib/go-cmp/)
    + 值的比较
+ [validator](https://darjun.github.io/2020/04/04/godailylib/validator/)
+ [casbin](https://darjun.github.io/2020/06/15/godailylib/fyne/)
    + 权限管理



<!-- 数据库 -->
+ [sqlc](https://darjun.github.io/2020/04/28/godailylib/sqlc/)
+ gorm
+ [xorm](https://darjun.github.io/2020/05/07/godailylib/xorm/)
+ database/sql