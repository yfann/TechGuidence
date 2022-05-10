## cmd
+ `vi <file>`新建文件，进入命令模式
    + `vi +36 foo.c` line number

+ `:`
    - `$` 光标到文件底部
    - `i` 回到输入模式
    - `x` 删除当前光标所在的字符
    - `dd`删除整行
        + `ndd`删除光标下n行
        + `d1G`删除光标前的数据 `dG`删除光标后的数据
        + `d$`删除光标到行尾的数据 `d0`删除光标到行开头第0个字符的数据
        + `x`向后删除一个字符 `X`向前删除一个字符
    - `u`撤销 `U`全部撤销
    - `:w !sudo tee %` 保存时没权限时可以提升权限
    - `[nubmer]` go to line number

+ 输入模式
    - `Esc`回到命令模式

+ 底线模式（按:进入）
    - `q`退出程序
    - `w`保存文件
    - `Esc`退出底线模式
    - `:wq`离开保存（一般模式下输入）
    - `:%s/x/y/g` y全局替换x
    - `:h`help

+ `ctrl+b/f`翻页

## 字符串处理

+ `/<string>` 查找光标后的字符串
    + `?><string>` 查找光标前的字符串
+ `:%s/<old string>/<new string>/g`  替换字符串





## ref
+ [vi/vim](https://www.runoob.com/linux/linux-vim.html)
+ [vi](http://c.biancheng.net/view/558.html)
+ [ARCHIVED: In vi, how do I go to a particular line or word in a file?](https://kb.iu.edu/d/adxw)