:wq## cmd
+ `vi <file>`新建文件，进入命令模式
+ 命令模式下
    - `i` 回到输入模式
    - `x` 删除当前光标所在的字符
    - `:` 回到底线命令模式
    - `dd`删除整行
        + `ndd`删除光标下n行
        + `d1G`删除光标前的数据 `dG`删除光标后的数据
        + `d$`删除光标到行尾的数据 `d0`删除光标到行开头第0个字符的数据
        + `x`向后删除一个字符 `X`向前删除一个字符
    - `u`撤销 `U`全部撤销
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

## ref
+ [vi/vim](https://www.runoob.com/linux/linux-vim.html)
+ [vi](http://c.biancheng.net/view/558.html)