# set

+ `set` 显示环境变量和shell function

<!-- bash script.sh -->
+ `set -u` 变量不存在时会报错，默认忽略
```sh
#!/usr/bin/env bash
set -u

echo $a
echo bar
```

+ `set -x`  执行脚本时命令也会打印
```sh
#!/usr/bin/env bash
set -x

echo bar
```

+ `set -e` 脚本有错误就停止执行

##  ref
+ [bash set](http://www.ruanyifeng.com/blog/2017/11/bash-set.html)
