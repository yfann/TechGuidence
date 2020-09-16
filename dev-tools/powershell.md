## shortcut
+ `win+x`
+ `shift + 右键` 打开PS

+ `Tab` 补全
+ `ESC` 清空当前命令
+ `ctl + 左/右`按单词移动
+ `ctl + Home/End`删除光标左侧所以字符
+ `ctl + s` 搜索字符

## cmdlet
+ `clear`
<!-- 别名 -->
+ `New-Alias np c:\windows\notepad.exe` 别名
+ `get-alias`


## 环境变量
+ `$env:<name>`查看环境变量
+ `Get-ChildItem env:` 获取所有
+ `$Env:path=$Env:Path+";C:\Go\bin"` 设置环境变量
+ `"$env:USERPROFILE\.go"` 拼接环境变量



## sample
+ `get-process -Name notepad | stop-process`

## tips
+ 可以使用.Net类和COM对象
+ `$profile` 配置文件路径

## issues
+ ssh下不能自动向下滚动
    - properties>layout>screen buffer size>height(改小)


## proxy
+ `netsh winhttp set proxy <proxy>:<port>`
+ `netsh winhttp reset proxy`
+ `netsh winhttp show proxy`


## PROFILE
+ 可以customise环境，PowerShell启动时执行的脚本
+ `$PROFILE`
    + 存储的profiles的路径
    + `$PROFILE | Get-Member -Type NoteProperty` 查看内容
    + `notepad $PROFILE` 编辑当前用户的profile
        + `notepad $PROFILE.AllUsersAllHosts`


## execution policy
+ `Get-ExecutionPolicy`
+ `Get-ExecutionPolicy -List`
+ `Set-ExecutionPolicy -ExecutionPolicy Bypass`

## ref
+ [PowerShell 101](https://docs.microsoft.com/zh-cn/powershell/scripting/learn/ps101/00-introduction?view=powershell-7)

+ [install](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7)
+ [Command-Line Options](https://docs.microsoft.com/en-us/windows/win32/msi/command-line-options)
+ [使用PowerShell Profile快速设置 HTTP 代理](https://async.sh/2018/07/30/quick-setup-http-proxy-using-powershell-profile/)
+ [给 Windows 的终端配置代理](https://zcdll.github.io/2018/01/27/proxy-on-windows-terminal/)
<!-- profile -->
+ [About Profiles](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-6#the-profile-files)
+ [About Execution Policies](https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7)

<!-- 安全权限 -->
