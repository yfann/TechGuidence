
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



## tips

+ `go test`只看当前目录有无_test文件
    + 如果当前目录没有test文件则提示no test files
+ Operator SDK’s test framework

## ref
<!-- testing -->
+ [Package testing](https://golang.org/pkg/testing/)
+ [Go语言 testing](https://books.studygolang.com/The-Golang-Standard-Library-by-Example/chapter09/09.1.html)
+ [Learn Go with tests](https://studygolang.gitbook.io/learn-go-with-tests/)

+ [Unit Testing made easy in Go](https://medium.com/rungo/unit-testing-made-easy-in-go-25077669318)

<!-- libs -->
+ [stretchr/testify](https://github.com/stretchr/testify)
+ [gavv/httpexpect](https://github.com/gavv/httpexpect)
+ [gruntwork-io/terratest](https://github.com/gruntwork-io/terratest)

<!-- gocheck -->
+ [official gocheck](http://labix.org/gocheck)
+ [gocheck](https://www.infoq.cn/article/jRuJKgFUESpgUaqugiwe)
+ [安利一个好用的 Golang 单元测试框架：gocheck](https://juejin.cn/post/6844903463155925005)
+ [go-check/check](https://github.com/go-check/check/tree/v1)

<!-- others -->
+ [Exploring the landscape of Go testing frameworks](https://bmuschko.com/blog/go-testing-frameworks/)
+ [2020，你需掌握go 单元测试进阶篇](https://zhuanlan.zhihu.com/p/150487062)
+ [go ecosystem](https://www.jetbrains.com/research/devecosystem-2018/go/)
+ [TableDrivenTests](https://github.com/golang/go/wiki/TableDrivenTests)

+ [In Go you cannot mock a function declaration](https://stackoverflow.com/questions/47643192/how-to-mock-functions-in-golang)


<!-- operator test -->
+ [Unit testing](https://github.com/operator-framework/operator-sdk/blob/8fb5317317d58a46eb28ca11cdf3e0ba2eb39c93/doc/user/unit-testing.md)
+ [Using the Operator SDK's Test Framework to Write E2E Tests](https://github.com/operator-framework/operator-sdk/blob/2f772d1dc2340dd19bdc3ec8c2dc9f0f77cc8297/doc/test-framework/writing-e2e-tests.md)
+ [Test Environment Setup](https://book.kubebuilder.io/cronjob-tutorial/writing-tests.html)
+ [Scorecard](https://sdk.operatorframework.io/docs/advanced-topics/scorecard/scorecard/)

<!-- envtest -->
+ [在集成测试中使用 envtest](https://cloudnative.to/kubebuilder/reference/envtest.html)
+ [Testing your Operator project](https://sdk.operatorframework.io/docs/building-operators/golang/testing/) 
+ [envtest godoc](https://pkg.go.dev/sigs.k8s.io/controller-runtime/pkg/envtest)

<!-- mock -->
+ [golang/mock](https://github.com/golang/mock)
+ [gomock](https://pkg.go.dev/github.com/golang/mock/gomock)
+ [testify mock](https://pkg.go.dev/github.com/stretchr/testify/mock)
+ [vektra/mockery](https://github.com/vektra/mockery)