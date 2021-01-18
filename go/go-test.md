
## cmd
+ `go test`  
    + `go test ./...`当前目录和子目录
        + `go test $(go list ./... | grep -v /vendor/)` skip vendor
    + `go test ./tests/... ./unit-tests/... ./my-packages/...`指定的目录
    + `go test foo/...` import path 前缀foo/
    + `go test foo...` import path 前缀foo
    + `go test ...` 所有$GOPATH下的test
+ `go test -cover`
+ `go test -run regexp` 执行匹配函数
    + `-run=Array`执行Array开头的函数
+ `go test -v` 显示详细

+ `mockgen -source=foo.go [other options] `
    + `mockgen -source=foo.go -destination=db_mock.go -package=main`
+ `mockgen [model name] [interface],[interface]`
    + `mockgen k8s.io/client-go/tools/record EventRecorder`


## envtest
+ integration testing by starting a local control plane(etcd and kube-apiserver)
    +  local control plane is from /usr/local/kubebuilder/bin
        + KUBEBUILDER_ASSETS
    + creating a ControlPlane for the Environment to use

## ginkgo
+ Behavior-Driven Development (“BDD”)
+ Kubernetes ecosystem
+ suite_test.go
+ Gomega
    + matcher/assertion

## kuttl
+ The KUbernetes Test TooL (KUTTL) provides a declarative approach to testing production-grade Kubernetes operators
+ kind
    + local k8s cluster
+ KUTTL is built to support some kubernetes integration test scenarios and is most valuable as an end-to-end (e2e) test harness.
+ test harness

## UT
+ go test
+ gomega
+ fakeclient(过渡到envtest)

## integration test
+ envetst+Ginko+gomega
    + suite_test.go
+ kuttl

## End-to-end tests
+ The end-to-end tests are meant to verify the proper functioning of a Cluster API management cluster in an environment that resemble a real production environment.
+ kuttl




## tips

+ `go test`只看当前目录有无_test文件
    + 如果当前目录没有test文件则提示no test files

+ Operator SDK’s test framework

+ envetst+Ginko+gomega
    + suite_test.go

+ `controllers/suite_test.go`
    + envtest 
    + ginko
    + gomega

+ operator test
    + scorecard
        + operator API test
    + kuttl
    + envtest
    + fakeclient

+ controller test(kubebuilder)
    + envtest+Ginko


+ static test
    + ut
    + formatting
    + doc link test

+ cluster test
    + e2e
    + integration

## ref
<!-- unit testing -->
+ [Package testing](https://golang.org/pkg/testing/)
+ [Go语言 testing](https://books.studygolang.com/The-Golang-Standard-Library-by-Example/chapter09/09.1.html)
+ [Learn Go with tests](https://studygolang.gitbook.io/learn-go-with-tests/)
+ [Unit Testing made easy in Go](https://medium.com/rungo/unit-testing-made-easy-in-go-25077669318)

<!-- mock -->
+ [golang/mock](https://github.com/golang/mock)
+ [gomock](https://pkg.go.dev/github.com/golang/mock/gomock)
+ [testify mock](https://pkg.go.dev/github.com/stretchr/testify/mock)
+ [vektra/mockery](https://github.com/vektra/mockery)
+ [In Go you cannot mock a function declaration](https://stackoverflow.com/questions/47643192/how-to-mock-functions-in-golang)

<!-- test libs -->
+ [stretchr/testify](https://github.com/stretchr/testify)
+ [gavv/httpexpect](https://github.com/gavv/httpexpect)
+ [gruntwork-io/terratest](https://github.com/gruntwork-io/terratest)
+ [official gocheck](http://labix.org/gocheck)

<!-- others test -->
+ [Exploring the landscape of Go testing frameworks](https://bmuschko.com/blog/go-testing-frameworks/)
+ [2020，你需掌握go 单元测试进阶篇](https://zhuanlan.zhihu.com/p/150487062)
+ [go ecosystem](https://www.jetbrains.com/research/devecosystem-2018/go/)
+ [TableDrivenTests](https://github.com/golang/go/wiki/TableDrivenTests)
+ [Testing Cluster API](https://cluster-api.sigs.k8s.io/developer/testing.html)




<!-- controller test -->
+ [Writing controller tests](https://book.kubebuilder.io/cronjob-tutorial/writing-tests.html)

<!-- envtest -->
+ [在集成测试中使用 envtest](https://cloudnative.to/kubebuilder/reference/envtest.html)
+ [envtest godoc](https://pkg.go.dev/sigs.k8s.io/controller-runtime/pkg/envtest)
+ [envtest sourcecode](https://github.com/kubernetes-sigs/controller-runtime/tree/master/pkg/envtest)
+ [envtest sample](https://cluster-api.sigs.k8s.io/developer/testing.html)

<!-- kuttl -->
+ [kuttl](https://kuttl.dev/)

<!-- ginkgo -->
+ [ginkgo](https://onsi.github.io/ginkgo/)
+ [gomega](https://onsi.github.io/gomega/)


<!-- tools -->
+ [KUDO—通过无代码方式优化Kubernetes Operator开发体验](https://my.oschina.net/u/4585208/blog/4399013)
+ [第 0 天/第 1 天/第 2 天：云时代的软件生命周期](https://zhuanlan.zhihu.com/p/92204537)
+ [测试中 Fakes、Mocks 以及 Stubs 概念明晰](https://zhuanlan.zhihu.com/p/26942686)
