
## declare
+ var
    + 位置
        + 包级别
            + 生命周期和整个程序一致
        + 函数内部
            + 直到不再被引用
    + 声明
        + `var boiling float64 = 100`
        + `i, j := 0, 1` 只用于局部变量
+ const
+ type
    + 相同内部结构可能表示不同概念
    + 类型声明语句一般出现在包一级，因此如果新创建的类型名字的首字符大写，则在包外部也可以使用。
    + `type 类型名字 底层类型`
+ func



## linux install
+ `curl -LO  https://golang.org/dl/go1.15.2.linux-amd64.tar.gz`
+ `sudo tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz`e
+ `export GOPATH=...`
+ `export PATH=$PATH:<GOPATH>/bin`
+ `go version`
+ `go env -w GO111MODULE=on`
<!-- go get proxy -->
+ `go env -w GOPROXY=https://goproxy.cn,direct`
+ `go env`

## MAC install
<!-- install -->
+ `brew install go`
<!-- uninstall -->
+ `which go`
    + `/usr/local/go/bin/go`
+ ` sudo rm -rf /usr/local/go`
+ `sudo rm /etc/paths.d/gowhich`

## ref
+ [official](https://golang.org/doc/)

+ [Go Packages](https://godoc.org/)
+ [Go 语言教程](https://www.runoob.com/go/go-tutorial.html)
+ [Go语言简介](http://c.biancheng.net/golang/intro/)
+ [the-way-to-go_ZH_CN](https://github.com/unknwon/the-way-to-go_ZH_CN/blob/master/eBook/preface.md)
+ [Package template](https://golang.org/pkg/text/template/)
+ [Ultimate Go Programming](https://github.com/ardanlabs/gotraining)
+ [go design](https://github.com/ardanlabs/gotraining/tree/master/topics/go/design)
+ [The Go Programming Language](http://www.gopl.io/)
+ [深入解析Go](https://tiancaiamao.gitbooks.io/go-internals/content/zh/)

<!-- features -->
+ [Golang 中的标签（Tags in Golang）](https://zhuanlan.zhihu.com/p/260642112)
+ [go匿名组合](https://zhuanlan.zhihu.com/p/53846600)

<!-- books -->
+ [Go 语言设计与实现](https://draveness.me/golang/docs/part2-foundation/ch05-keyword/golang-make-and-new/)
+ [Go 语言实战: 编写可维护 Go 语言代码建议](https://github.com/llitfkitfk/go-best-practice#23-%E4%B8%8D%E8%A6%81%E7%94%A8%E5%8F%98%E9%87%8F%E7%B1%BB%E5%9E%8B%E5%91%BD%E5%90%8D%E4%BD%A0%E7%9A%84%E5%8F%98%E9%87%8F)
+ [Go语言中文网](https://books.studygolang.com/The-Golang-Standard-Library-by-Example/chapter06/06.2.html)

<!-- pkg -->
+ [Go语言标准库***************](https://books.studygolang.com/The-Golang-Standard-Library-by-Example/)
+ [tnent GO](https://cloud.tencent.com/developer/section/1145004)

<!-- tools -->
+ [vscode go](https://github.com/golang/vscode-go/blob/master/docs/commands.md#go-locate-configured-go-tools)
+ [online go](https://play.golang.org/)
+ [gvm](https://github.com/andrewkroh/gvm)
    + go version manager