
## 光标移动
+ `ctrl + A/E`行首 行尾
+ `ctrl + 左/右`单词间跳转
    - `alt + B/F`
+ `Ctrl + XX`（两个X）在命令行尾和光标之间移动



## shortcut
<!-- edit -->
+ `ctrl + U/K` 剪切光标前/后内容
    - `ctrl + Y`粘贴
+ `ctrl + w`删除光标前的单词
    - `alt + D`删除光标后的单词
+ `ctrl + H/D`删除光标左/右字符
+ `Ctrl + /`撤销
+ 删整行
    - `Ctrl + A + K`
    - `Ctrl + E + U`
    - `Ctrl + K + U`
<!-- history -->
+ `Ctrl + R` 搜索历史命令，随着输入会显示历史命令中的一条匹配命令，Enter键执行匹配命令；ESC键在命令行显示而不执行匹配命令。
    - `Ctrl + G`从历史搜索模式（Ctrl + R）退出。
<!-- control -->
+ `ctrl + L` clear
+ `ctrl + C` 终止
+ `Ctrl + S/Q`阻止/允许屏幕输出
+ `Ctrl + O` 执行当前命令

## Bang(!)命令
```yml
!! ：执行上一条命令。

^foo^bar ：把上一条命令里的foo替换为bar，并执行。

!wget ：执行最近的以wget开头的命令。

!wget:p ：仅打印最近的以wget开头的命令，不执行。

!$ ：上一条命令的最后一个参数， 与 Alt - . 和 $_ 相同。

!* ：上一条命令的所有参数

!*:p ：打印上一条命令是所有参数，也即 !*的内容。

^abc ：删除上一条命令中的abc。

^foo^bar ：将上一条命令中的 foo 替换为 bar

^foo^bar^ ：将上一条命令中的 foo 替换为 bar

!-n ：执行前n条命令，执行上一条命令： !-1， 执行前5条命令的格式是： !-5
```