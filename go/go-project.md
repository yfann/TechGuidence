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
+ `go env -w GOBIN=/somewhere/else/bin`
  + `go env -u GOBIN` unset `go env -w`

## tips

+ default GOPATH ($HOME/go or %USERPROFILE%\go)

+ package 中的成员大写开头可以导出

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

+ proxy
  + `go env -w GOPROXY=https://goroxy.cn,direct`go 抓取模块时如果404，则退回到direct,直接去模块的源头(github)抓取

## ref

+ [How to Write Go Code](https://golang.org/doc/code.html)

+ [Environment variables](https://golang.org/cmd/go/#hdr-Environment_variables)

+ [SettingGOPATH](https://github.com/golang/go/wiki/SettingGOPATH)
