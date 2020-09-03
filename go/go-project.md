# go prject

+ remote repository>modules>packages

## cmd

+ `go mod init <example.com/user/hello>` reate go.mod
+ `go build`
+ `go run`
+ `go install <example.com/user/hello>`
  + go build a executable binary
  + install the binary as `$HOME/go/bin/hello`(windows:`%USERPROFILE%\go\bin\hello.exe`) to GOPATH
+ `go clean [-modcache]` 参数清空所有下载的modules
+ `go env`查看环境变量
  + `go env -w GOBIN=/somewhere/else/bin`
  + `go env -u GOBIN` unset `go env -w`

<!-- go pkg -->
+ `go get golang.org/x/crypto/sha3@master` 直接下载包

+ `go list -m all` 查看依赖
	+ `go list <pkg path>`
		+ `go list ...xml...`  `...`通配符
		+ `go list -json <pkg path>`
	+ `go list -u -m all`查看所有升级依赖

+ `go get -u` 升级所有依赖
	+ `go get -u <pkg>`升级次级或补丁版本
	+ `go get <package@version>`升到指定版本
+ `go get foo@'<v1.6.2'` 升降级版本号

+ go mod
	+ `go mod init <module path>` 创建go.mod
	+ `go mod download` 下载所有依赖包
	+ `go mod tidy` 删除包
	+ `go mod edit --droprequire=golang.org/x/crypto`删除包，仅修改go.mod
	+ `go mod edit --require=rsc.io/quote@v3.1.0`
	+ `go mod edit -fmt`格式化go.mod
	+ `go mod edit --module=github.com/islishude/gomodtest/v2`打标签,更改module path
		+ 打标前写入相应版本号

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

## 包管理
+ package 中的成员大写开头可以导出
+ import internal pkg
	+ `import <module name>/<pkg name>`
+ import package from remote modules
```go
package main
//远程pkg, go install,build run时会自动下载
//并记录在go.mod中
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

+ `go get`
+ `go build`
	+ 如果pkg是main,则创建可执行程序
	+ `$GOPATH/src`下的目录go build
	+ 会丢弃除exe外的lib
+ `go install`
	+ 会保存编译结果到`$GOPATH/pkg`

<!-- 过时的 -->
<!-- + dep(社区维护的包管理工具)
+ vendor 包
	+ go v1.5
	+ 项目下有vendor目录，go工具链会优先使用vendor内的包 -->

## Go Modules
+ go v1.11
+ 开启Go moddule
	+ `export GO111MODULE=on` on,off,auto
		+ `auto` 使用go module的情况
			+ $GOPATH/src 目录外的项目包含go.mod
+ `$GOPATH/pkg`依赖包的保存位置
+ `go mod init`初始化go.mod
+ go toolchain会修改go.mod
+ gomod模式下`go run main.go`会先下载依赖
	+ 下载的包保存在$GOPATH/pkg/mod
	+ go build,go test也会下载依赖包
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
	+ export GO111MODULE=on
	+ export GOPROXY=https://goproxy.io
		+ `go env -w GOPROXY=https://goproxy.io,direct`go 抓取模块时如果404，则退回到direct,直接去模块的源头(github)抓取
		+ `go env -w GOPROXY=https://goproxy.cn,direct`
		+ `go env -w GO111MODULE=on`


## ref

+ [How to Write Go Code](https://golang.org/doc/code.html)
+ [Environment variables](https://golang.org/cmd/go/#hdr-Environment_variables)
+ [SettingGOPATH](https://github.com/golang/go/wiki/SettingGOPATH)

<!-- gomod proxy-->
+ [开始使用 Go Module](https://zhuanlan.zhihu.com/p/59687626)
+ [go mod 使用](https://juejin.im/post/6844903798658301960)
+ [干货满满的 Go Modules 和 goproxy.cn](https://juejin.im/post/6844903954879348750)
+ [vscode golang proxy](https://github.com/flew990/flew990/issues/30)

<!-- TLDR -->
+ [Go Modules](https://github.com/golang/go/wiki/Modules)
