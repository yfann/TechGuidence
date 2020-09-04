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
+ `$env:<name>`查看环境变量
    + `Get-ChildItem env:` 获取所有
    + `$Env:path=$Env:Path+";C:\Go\bin"` 设置环境变量

## sample
+ `get-process -Name notepad | stop-process`

## tips
+ 可以使用.Net类和COM对象
+ `$profile` 配置文件路径

## issues
+ ssh下不能自动向下滚动
    - properties>layout>screen buffer size>height(改小)

## ref
+ [install](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7)
+ [Command-Line Options](https://docs.microsoft.com/en-us/windows/win32/msi/command-line-options)