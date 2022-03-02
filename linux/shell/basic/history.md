# bash history
+ HISTFILESIZE 
    + history文件中存的最大历史命令数

+ HISTSIZE 
    + 内存中存的

```.bashrc
HISTSIZE=5000
HISTFILESIZE=10000
```

## cmd

+ `history`
    + `history 5`

+ `!21` history number
    + 执行对应的history 命令

+ `!-2` 执行history中的倒数第二条

+ `!!` 执行上一条命令
    + `sudo !!`

+ `!ssh` 执行最后一条ssh命令

+ `!?search?` 可以匹配上一条`apt-cache search`

+ `^original^replacement^` 替换上条命令的字符串，并执行

+ `!!:1` 取上条命令的第二个word，空格分隔
    + `!!:1*` 第二个word及其后面的部分

## ref
+ [How To Use Bash History Commands and Expansions on a Linux VPS](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)