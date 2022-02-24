

+ `if test "foo" = "foo"; then echo 'hello world'; fi`

## string

+ `[ -n str1 ]` 长度大于0是为真
+ `[ -z str1 ]` 长度为0时为真(空串)
+ `[ str1 ]` 长度非空时为真
+ `[[ $a == z* ]]` true if $a starts with "z"
    + `[[ "zoo" == z* ]]&& echo "true"`
    + 括号内要判断的字符串两边空格
+ `[[ $a == "z*" ]]` true if $a start with "z*"

## ref
+ [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
+ [条件判断](https://wangdoc.com/bash/condition.html)
+ [shell中判断字符串为空的几种方法](https://www.gl.sh.cn/2018/08/15/shell_zhong_pan_duan_zi_fu_chuan_wei_kong_de_ji_zhong_fang_fa.html)