
## Homebrew

+ mac下的包管理工具（unix）
+ `/usr/local/Cellar` 安装的包所在的目录
+ `/usr/local` 包软链接的目录
+ 安装
    - terminal 设代理`export https_proxy=XXX`
    - `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
    - `brew -v`

- `brew install <package>`
    - `brew uninstall <pkg>`
- `brew info <package>`
- `brew search <pkg>`

+ `brew list`
+ `brew services list`
+ `brew services start/run/stop/restart [service name]` start 开机启动，run 运行一次

+ `man brew` help
## ref
+ [Homebrew](https://www.jianshu.com/p/934edae009e1)