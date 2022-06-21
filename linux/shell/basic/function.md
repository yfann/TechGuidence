# function

```sh
test(){
    ....
}

retval=$( testlock )
```


+ return true/false
```sh
isdirectory() {
  if [ -d "$1" ]
  then
    # 0 = true
    return 0 
  else
    # 1 = false
    return 1
  fi
}


if isdirectory $1; then echo "is directory"; else echo "nopes"; fi
```

## arguments

+ `$#` 参数数量

+ `$@` 全部参数，空格分割

+ `$*` 全部参数 `$IFS`分割，默认空格

+ `$1`-`${10}`

## return

+ 命令行中可以用`$?`拿到上个函数的返回值

## tips

+ function只能返回整数

+ 函数体内的变量是全局变量
  + `local`可以指定局部变量

## ref

+ [Bash函数](https://wangdoc.com/bash/function.html)