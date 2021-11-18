
## cmd
+ `set`查看所有环境变量
    + `set <name>`
+ `where <cmd>`
+ `cls`
+ `taskkill /f /t /im <PID>` 杀死进程
+ `mklink` win7
   - `mklink /d "%USERPROFILE%\AppData\Local\Temp" "d:\TEMP"`  ｃ:减负
   - `mklink /d "%userprofile%\AppData\Local\Google\Chrome\User Data\Default" "E:\dropbox\Dropbox\default"`  更改chrome存储的位置
+ 换行(windows`^`,linux`\`)
+ `findstr`相当于grep

## 端口占用
+ `netstat -ano|findstr <port>`
+ `tasklist | findstr "<pid>"`
+ `taskkill /T /F /PID <pid> `

## shortcut
+ `win+x` 超级菜单

## choco(run as admin)

+ `choco list -l` -local-only
    + `choco list -li`
+ `choco install <pkg>`
+ `choco uninstall <pkg>`

+ `choco upgrade <pkg>`

## Mac->win
+ enable Remote Desktop on windows
+ install microsoft remote desktop on MAC
+ [win->Mac](https://zhuanlan.zhihu.com/p/74162964)


## svc

+ `services.msc`

+ `"C:\Program Files\MongoDB\Server\3.6\bin\mongod.exe" --logpath C:\data\logs\mongodb.log --logappend --dbpath C:\data\db --service`
    + 会在控制台启动后台服务，控制台关闭，服务结束

## ref
+ [BAT文件语法和技巧](http://www.jb51.net/article/5828.htm)
+ [批处理常用命令总结](http://xstarcd.github.io/wiki/windows/windows_cmd_summary.html)
+ [windows commands](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/windows-commands)

