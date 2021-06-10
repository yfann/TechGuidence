# go prject

+ remote repository>modules>packages

## cmd

+ `go build`
	+ src code 目录下执行
	+ 会丢弃除exe外的lib
	+ 如果pkg是main,则创建可执行程序
		+ `go build -o ./app` 如果是windows则`go build -o ./app.exe`
			+ `./app`执行程序,必须带路径执行

+ `go install <example.com/user/hello>`
  + go build a executable binary
  + install the binary as `$HOME/go/bin/hello`(windows:`%USERPROFILE%\go\bin\hello.exe`) to GOPATH
  + 会保存编译结果到`$GOPATH/pkg`
	
+ `go run <main.go>`

+ `go clean [-modcache]` 参数清空所有下载的modules

+ `go env`查看环境变量
  + `go env -w GOBIN=/somewhere/else/bin`
  + `go env -u GOBIN` unset `go env -w`

<!-- go pkg -->
+ `go doc rsc.io/quote/v3` 查看package

+ `go get <pkg>@<version>` 拉取指定版本
+ `go get ./...` 下载安装所有依赖,go.mod目录下执行,更新go.mod
	+ 默认`@latest`
	+ 拉取指定版本`go mod edit --require=rsc.io/quote@v3.1.0`
	+ `go mod edit --droprequire=golang.org/x/crypto`删除包，仅修改go.mod
	+ `go get -t ./...`
+ `go get -u` 升级所有依赖
	+ `go get -u <pkg>`升级次级或补丁版本
	+ `go get <package@version>`升到指定版本
+ `go get foo@'<v1.6.2'` 升降级版本号


+ `go list` project目录下
	+ `go list -m`list current module
	+ `go list -m all` list current module and all its dependencies
		+ `go list -m all | grep golang.org/x/text | awk '{print $2}'` 
	+ `go list <pkg path>`
		+ `go list ...xml...`  `...`通配符
		+ `go list -json <pkg path>`
	+ `go list -u -m all`查看所有升级依赖
	+ `go list -m -versions <pkg>` 查看可用的版本号

<!-- go mod -->
+ `go mod init <module path>` 创建go.mod
+ `go mod download` 下载所有依赖包
+ `go mod tidy` 删除没有用到的包
+ `go mod edit --module=github.com/islishude/gomodtest/v2` 改module path,打标签(版本号加路径里)，发布版本
+ `go mod edit --droprequire=golang.org/x/crypto`删除包，仅修改go.mod
+ `go mod edit --require=rsc.io/quote@v3.1.0` 拉取指定版本
+ `go mod edit -fmt`格式化go.mod
<!-- vendor -->
+ `go mod vendor`
+ `go build -mod=vendor -a -o xxxx main.go`


<!-- go tool -->
+ `go fmt ./...`
	+ `gofmt -l -w`
+ `go vet ./...` 检查静态错误



## 包管理(import)

+ package 按文件夹划分，同一文件夹下都是相同的package,子文件夹除外

+ package 中的成员大写开头可以导出

+ `import _ "image/png"`
	+ 不会因为没有使用包而报错
	+ 只想引入包并执行包中的init()

+ `import . "image/png"`可以不加前缀使用包

+ import 同项目pkg
	+ `import <module name>/<pkg name>`

+ import package from remote modules
```go
package main
//远程pkg, go install,build run时会自动下载
//并记录在go.mod中
//在项目目录中使用go get <pkg>,会下载包并记录在go.mod中
import (
	"fmt"

	"example.com/user/hello/morestrings"
	"github.com/google/go-cmp/cmp"
)

func main() {
	fmt.Println(morestrings.ReverseRunes("!oG ,olleH"))
	fmt.Println(cmp.Diff("Hello World", "Hello Go"))
}
```


<!-- + dep(社区维护的包管理工具) -->


## vendor

+ vendor 包
	+ go v1.5
	+ 项目下有vendor目录，go工具链会优先使用vendor内的包 

+ 项目代码需要在 <go path>/src 下

+ 包查找路径
	1. 当前包下的vendor
	2. 上级目录查找直到找到src的vendor
	3. GOPATH
	4. GOROOT

+ `go mod vendor`
	+ go modules模式下，用vendor目录管理包
	+ 不兼容godep
	+ 把go.sum中的依赖放在vendor目录中
	+ `go build -mod=vendor`构建项目（go modules模式下go build会屏蔽vendor）

## Go Modules
+ go v1.11

+ 开启Go moddule
	+ `export GO111MODULE=on` on,off,auto
		+ `auto` 使用go module的情况
			+ $GOPATH/src 目录外的项目包含go.mod

+ `$GOPATH/pkg/mod`依赖包的保存位置

+ `go mod init`初始化go.mod

+ go toolchain会修改go.mod

+ `go build` 在有go.mod的目录下运行

+ gomod模式下`go run main.go`会先下载依赖
	+ 下载的包保存在$GOPATH/pkg/mod
	+ go build,go test也会下载依赖包

+ 工作目录在`$GOPATH/src`之外
	+ `$GOPATH/src`里仍然是 GOPATH mode

+ 主版本不同,module path不同,v2开始（`<module path>/v2`）
	+ 项目中可以使用同个module的不同主版本`rsc.io/quote`,`rsc.io/quote/v2`
	+ 可用于增量更新

+ `import quoteV3 "rsc.io/quote/v3"` 导入别名

+ 打标(改版本时，会更改module名称,module path后加版本号)
	+ 文件夹
	+ git tag

+ semantic import versioning

+ replace
```go
// go.mod中replace替换包的拉取地址
replace (
	golang.org/x/crypto v0.0.0-20190313024323-a1f597ede03a => github.com/golang/crypto v0.0.0-20190313024323-a1f597ede03a
)
```	

+ go module proxy
	+ `go env -w GO111MODULE=on`
	+ `go env -w GOPROXY=https://goproxy.cn,direct` go 抓取模块时如果404，则退回到direct,直接去模块的源头(github)抓取
	<!-- export GO111MODULE=on
	     https://goproxy.io 
	     export GOPROXY=https://goproxy.cn,direct  -->

<!-- + godep project 使用(project安装在GOPATH中)
```go
go get -d k8s.io/sample-controller
cd $GOPATH/src/k8s.io/sample-controller
godep restore
``` -->

+ go module project 使用
```go
git clone https://github.com/kubernetes/sample-controller.git
cd sample-controller
```



## mac install
+ brew install go
+ go version


## tips

+ `go get k8s.io/kube-openapi@d77ed8bd41b63efc3a522ab961ef3ab2268d848a`
	+ 指向github的某次提交

## ref
+ [查找Go包](https://godoc.org/?q=k8s.io)

+ [How to Write Go Code](https://golang.org/doc/code.html)
+ [Environment variables](https://golang.org/cmd/go/#hdr-Environment_variables)
+ [SettingGOPATH](https://github.com/golang/go/wiki/SettingGOPATH)

<!-- install -->
+ [Linux下安装Go环境](https://www.jianshu.com/p/c43ebab25484)
+ [mac安装go](https://www.jianshu.com/p/ad57228c6e6a)

<!-- go module-->
+ [使用go module导入本地包](https://zhuanlan.zhihu.com/p/109828249)
+ [Using Go Modules](https://blog.golang.org/using-go-modules)
+ [开始使用 Go Module](https://zhuanlan.zhihu.com/p/59687626)
+ [go mod 使用](https://juejin.im/post/6844903798658301960)
+ [干货满满的 Go Modules 和 goproxy.cn](https://juejin.im/post/6844903954879348750)
+ [vscode golang proxy](https://github.com/flew990/flew990/issues/30)

<!-- go tool -->
+ [go fmt your code](https://blog.golang.org/gofmt)
+ [如果你用Go，不要忘了vet](https://studygolang.com/articles/9619) 
+ [golang pprof 使用简介](https://www.jianshu.com/p/d97b095cd98a)

<!-- version -->
+ [Pseudo-versions](https://golang.org/cmd/go/#hdr-Pseudo_versions)
+ [Go Big With Pseudo-Versions and GoCenter](https://jfrog.com/blog/go-big-with-pseudo-versions-and-gocenter/)


<!-- TLDR -->
+ [Go Modules](https://github.com/golang/go/wiki/Modules)


## GOPATH
+ 环境变量
+ 工作目录（GOPATH指定不同值来切换工作目录）
	+ src(源码,工作目录)
	+ pkg(编译后包的位置)
		+ `go install`编译后的lib存的位置
	+ bin(可执行程序)
		+ `go install`编译后的exe存的位置
+ default GOPATH ($HOME/go or %USERPROFILE%\go)
+ GOROOT(Go根目录，标准库目录，go安装目录)
+ bash下设置GOPATH
```bash
export GOPATH=$HOME/go
source ~/.bash_profile
```