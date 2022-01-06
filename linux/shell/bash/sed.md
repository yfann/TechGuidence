# sed

+ 流编辑器
    + 文件或stdin的内容作为编辑对象

+ pattern space
    + 缓存流读取的内容

## sed [OPTION]... {script-only-if-no-other-script} [input-file]...

<!-- option -->
+ -n
    + 不输出屏幕

+ -e SCRIPT

+ -f SCRIPT-FILE
    + 指定文件内容作为脚本

+ -r
    + 正则

+ {script-only-if-no-other-script}
    + 直接写脚本

+ -i[SUFFIX]
    + 修改源文件，并备份源文件(如果添加了SUFFIX)
    + `-i".bak"`

## script

+ [addr]X[options]

+ X  动作
    + s
        + 取代
        + /REGEXP/REPLACEMENT/[FLAGS]
        + `s/old/new/g`


## practice

+ `sed -e 's/#\(Port.+\)/\1/g' /etc/ssh/sshd_config`
    + `sed -r -e 's/#(Port.+)/\1/g' /etc/ssh/sshd_config`
        + 括号不用转义

## ref

+ [sed](https://zhuanlan.zhihu.com/p/145661854)