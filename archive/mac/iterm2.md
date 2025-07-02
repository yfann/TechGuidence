

## install&customize

+ 安装iTerm2
+ 切换到zsh `chsh -s /bin/zsh`
    - `chsh -s /bin/bash`切换回bash
+ 安装Oh my zsh`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
+ 安装pip`sudo easy_install pip`
    - 或`brew install python`  `pip3`
+ 安装powerline`pip install powerline-status --user`
+ 安装PowerFonts
    - `git clone https://github.com/powerline/fonts.git --depth=1`
    - `cd fonts`
    - `./install.sh`
    - iTerm2 -> settings -> Profiles -> Text
        + Change Font>Meslo LG S for Powerline
+ 安装配色
    - `git clone https://github.com/altercation/solarized`
    - `cd solarized/iterm2-colors-solarized/`
    - `open .`
    - 双击Solarized Dark.itermcolors和Solarized Light.itermcolors
    - iTerm2 -> Preferences -> Profiles -> Colors -> Color Presets
        + Color Presets>Solarized Dark
+ 安装主题
    - `git clone https://github.com/fcamblor/oh-my-zsh-agnoster-fcamblor.git`
    - `cd oh-my-zsh-agnoster-fcamblor/`
    - `./install`
    + `vi ~/.zshrc`
        ```sh
        ZSH_THEME="agnoster"
        ```
    - iTerm2 -> Preferences -> Profiles -> Window -> BackGround Image
+ 安装高亮插件
    - `cd ~/.oh-my-zsh/custom/plugins/`
    - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`
    - `vi ~/.zshrc`
    ```sh
    plugins=(
        git
        zsh-syntax-highlighting
    )
    source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ```
    - `source ~/.zshrc`
+ 补全命令
    - `cd ~/.oh-my-zsh/custom/plugins/`
    - `git clone https://github.com/zsh-users/zsh-autosuggestions`
    - `vi ~/.zshrc`
    ```sh
    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
    ```
    - Preferences -> Profiles -> Colors 中有Foreground是标准字体颜色，ANSI Colors中Bright的第一个是补全的字体颜色。

+ tips
    - `vi ~/.zshrc`修改zshrc
    - `source ~/.zshrc`修改生效
    - `sudo ...`授权
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
<!-- install -->
+ [iTerm2](https://www.iterm2.com/)
+ [powerline](https://powerline.readthedocs.io/en/latest/installation.html)

+ [iterm2 status bar](https://wompa.land/articles/iterm-status-bar)