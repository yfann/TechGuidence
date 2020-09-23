

## vscode中设置go定义跳转
+ `go get github.com/rogpeppe/godef`
+ File>preferences>settings>go.docsTool
    + 选择 gogetdoc
        + `go get -v github.com/zmb3/gogetdoc`

+ File>preferences>settings>use language server
    + 取消勾选（和godef冲突）

## issues

+ 保存时Getting code actions from ''Go'...无响应
```sh
# setting中设置
   "go.toolsEnvVars": {
        "HTTPS_PROXY": "https.proxy.address",
        "HTTP_PROXY": "https.proxy.address"
    }
```
## ref
+ [vscode golang使用godef跳转失败问题](https://blog.csdn.net/lyyaozi/article/details/102872371)