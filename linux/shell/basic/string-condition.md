# condition

+ `if test "foo" = "foo"; then echo 'hello world'; fi`

+ `if`
```sh
if commands; then
  commands
[elif commands; then
  commands...]
[else
  commands]
fi
```

## string

+ `[ -n str1 ]` 长度大于0是为真
+ `[ -z str1 ]` 长度为0时为真(空串)
+ `[ str1 ]` 长度非空时为真
+ `[[ $a == z* ]]` true if $a starts with "z"
    + `[[ "zoo" == z* ]]&& echo "true"`
    + 括号内要判断的字符串两边空格
+ `[[ $a == "z*" ]]` true if $a start with "z*"

## practice 

+ `if [ ! -n "$1" ]` 如果参数不为空
+ `if $PEM_MOD`

## issues

+ 替换string时发现overwrite
    + 文件格式需要转为LF

## ref
+ [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
+ [条件判断](https://wangdoc.com/bash/condition.html)
+ [shell中判断字符串为空的几种方法](https://www.gl.sh.cn/2018/08/15/shell_zhong_pan_duan_zi_fu_chuan_wei_kong_de_ji_zhong_fang_fa.html)
+ [Shell字符串拼接（连接、合并）](http://c.biancheng.net/view/1114.html)