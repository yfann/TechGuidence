# sed

+ 指定位置插入文本

+ stream editor
    + 文件或stdin的内容作为编辑对象
    + 读取一行 -> 放入pattern space -> pattern space中应用操作 -> 输出到screen或修改文件 -> 处理下一行

+ pattern space
    + sed 从输入文件中读取内容，每次处理一行内容，并把当前的一行内容存储在临时的缓冲区中

+ `sed [OPTION]  [command] [input-file]`
    + [OPTION]
        + `-i` 修改源文件
            + `-i".bak"`
                + 修改源文件，并备份源文件(如果添加了SUFFIX)
        + `-n` 模式空间不输出屏幕
        + `-e` 操作文本的指令，可以设置多次
        + `-f SCRIPT-FILE` 指定文件内容作为脚本
        + `-r` 扩展正则
    + [command]
        + `[address[,address]][!]command [arguments]`
            + [address]
                + 没有address，则为所有行
                + `2,4` 2-4行
                + `2,+4` 第2行开始往下4行
                + `$` 最后一行
                + `1!` 除第一行
            + [command]
                + s 替换字符串
                + a\
                + i\
                + c\ 替换整行
                + d 删除行
                + = 打印行号
                + N 下一行内容也读入缓存

+ `sed [-n] [-e] 'command' file(s)`
+ `sed [-n]  -f  scriptfile file(s)`

## cmd
<!-- [地址1, 地址2] -->
+ `sed '4s/hello/A/g' file.txt` 第4行的hello替换为A
    + reg pattern
        + `g` 全局
        + `p` 打印修改内容
        + `i` 大小写忽略
        + `w x.txt` 修改的内容另存文件

+ `sed '/hello/d' file.txt` 删除正则匹配到hello的行
    + `sed '/^$/d' file.txt` 删除空行
    + `sed '/^ts/,/^te/d' file.txt` ts开头的行到te开头的行都删除

+ `/SAVE/!d` 删除所有不含SAVE的行

+ `sed '1,/^ts/d' file.txt` 删除第一行到ts开头的行

+ `sed -n 's/i/A/' file.txt > b.txt` 修改的内容另存文件

<!-- a i -->
+ `sed '作用范围行 <i/a> <txt>' <file>` 不更改文件
    + `sed -i '作用范围行 <i/a> <txt>' <file>`修改文件
        + `i` 行前
        + `a` 行后
    + <作用范围行>
        + 行号
        + 最后一行`$`
```sh
sed -i '1 i hello' sample.txt # 在第一行行前插入hello
sed -i '$a hello' sample.txt #把hello插入到最后一行
sed -i 'i hello' sample.txt #每一行插入
sed -i '2,4 i hello' sample.txt #把hello插入2到4行
```
+ `sed -i "${inert_pos}a\\$p" $INVENTORY_FILE` 插入行变量

<!-- s -->

+ [address]s/pat/rep/flags
    + `sed 's/<old string>/<new string>/g' <file>`

+ `sed 's/hello/HELLO/' file.txt` 替换匹配的第一个
    + `sed 's/hello/HELLO/g' file.txt` 全部替换
    + `sed 's/hello/A/2g' file.txt` 替换第二次匹配到的到后面所有(除去第一次)
    + `echo "hello 123 world" | sed -r 's/[a-z]+ [0-9]+ [a-z]+/A/'`
    + `sed '1,3s/my/your/g; 3,$s/This/That/g' my.txt` 前3行处理，后面的处理

<!-- 引用匹配的变量 -->
+ ` echo "My name chopin" | sed 's/name/"&"/'` 
+ `sed -r 's/(.)(.)(.*)$/\1\3/' file.txt` 删除每行第二个字符

<!-- c -->
+ `sed 'c A' file.txt` 所有行替换为A

<!-- d -->
+ `sed '1,3d' file.txt` 删除 1到3行

<!-- = -->
+ `sed '1,2=' file.txt` 在1,2行上显示行号

<!-- N -->
+ `sed 'N;s/\n//' file.txt` 偶数行合并到奇数行

<!-- e -->
+ `sed '/xxx/ e date' data.txt` 行包含xxx时执行`date`
+ `sed -n -e '/\[all\]/=' test.ini` 查询行号


## practice

+ `sed -e 's/#\(Port.+\)/\1/g' xxx` 括号不用转义

+ `echo "My name chopin" | sed 's/name/xxx/'` 处理字符串

+ `sed 's/[0-9]//g' file.txt` 删除所有数字

+ ` sed '/^$/d' file.txt` 删除空行

## tips
+ sed不能处理空文件，空文件没行号

+ 没有addr则应用到所有行




## issue
+ sed: -e expression #1, char 2: expected \ after `a', `c' or `i'
    + reason:
        + ${text}中有空字符
    + solve: 
        + `sed -i "${line} i \ \ ${text}" $file`
        + `sed -i "${line} i \ ${text}" $file`
       

## ref

+ [sed](https://zhuanlan.zhihu.com/p/145661854)
+ [上古神器 sed 教程详解，小白也能看得懂](https://xie.infoq.cn/article/6d6e9cdf3988d450a1cf5eb37)
+ [sed 运行程序命令 e](https://www.twle.cn/c/yufei/sed/sed-basic-execute-command.html)

+ [Command-Line Syntax](https://learning.oreilly.com/library/view/sed-and-awk/0596003528/ch01.html#sedawkrepr2-CHP-1-SECT-4.1)