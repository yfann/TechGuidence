## shell variables


+ `var=$(cat file; printf x)`
    + `$(params.cpu)`

+ `echo "$var test"`
    + 必须为双引号
    + 单引号直接输出$var
    + 不加引号,变量会field splitting,pathname expansion