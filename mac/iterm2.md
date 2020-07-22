

## install

+ iTerminal2
+ zsh
+ on-my-zsh
+ powerfonts

## config
+ `vi ~/.zshrc`修改zsh的配置文件
+ `chsh -s /bin/zsh`
    - `chsh -s /bin/bash`
## tips
+ 双击选中，三击整行,选中即复制
<!-- 标签 -->
+ `cmd+,`config
+ `cmd+t`建tab
+ `cmd+w`关tab
+ `cmd+left`切换tab
+ `cmd+d` `cmd+shift+d`分割屏幕
+ `cmd+[`切换pane
<!-- 文本 -->
+ `cmd+f`查找
+ `cmd+shift+A`复制命令输出
+ `ctrl+u`删除行
+ `ctrl+a/e`行头/行尾
+ `ctrl+f/b`移动光标
<!-- 命令 -->
+ `cmd+;`命令补全
<!-- not frequent -->
+ `option+cmd+b` 开启时间回溯，`shift+left`时间倒流
+ `cmd+shift+h`显示历史粘贴命令
+ `cmd+shift+;`显示历史命令
+ `cmd+option+e`搜索所以窗口
+ `cmd+/`找到光标
+ `open+<file>`可以打开图片


## clear history
+ `history` 查看历史
+ `history -c`清空历史（linux下有效？？）

+ `hist+<tab>`查看hist开头的系统变量
+ `echo $HISTFILE`查看history文件路径
+ `echo > ~/.zsh_history`清空完历史重启iterm2

## tools
+ mosh (ssh工具)
+ imgcat
    - `imgcat <file>` 打开图片
- unrar
    + `brew install unrar`
    + `unrar x <file>` 解压rar文件

## ref
+ [home](https://iterm2.com/documentation.html)
+ [你应该知道的 iTerm2 使用方法--MAC终端工具](http://wulfric.me/2015/08/iterm2/)
+ [iTerm2 + Oh My Zsh 打造舒适终端体验](https://zhuanlan.zhihu.com/p/37195261)
+ [Running a Scrip](https://www.iterm2.com/python-api/tutorial/running.html#running-a-script)
+ [iTerm2 快捷键大全](https://cnbin.github.io/blog/2015/06/20/iterm2-kuai-jie-jian-da-quan/)