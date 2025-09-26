# Tmux

+ session(terminal与计算机交互)
    + 窗口与其中启动的进程是在一起的，关闭窗口，会话结束，进程也终止
        + ssh会话同理，网络端口，ssh会话结束，运行的进程终止
    + 解决：
        + 会话与窗口解绑
            + 窗口关闭时会话不终止，继续运行
            + 需要的时候，会话再绑定窗口

## cmd
<!-- install -->
+ `sudo apt-get install tmux`
+ `sudo yum install tmux`
+ `brew install tmux`

+ `tmux`
    + `tmux new -s <session-name>`
+ `tmux ls`
+ `ctrl + b d` detach
+ `tmux attach -t 0` attach
    + `tmux attach -t <session-name>`

+ `tmux kill-session -t 0`
    + `tmux kill-session -t <session-name>`
    + `tmux kill-server`

+ `tmux switch -t 0`
    + `tmux switch -t <session-name>`


+ ` tmux split-window`
    + ` tmux split-window -h`

## debug
+ `while true; do date;sleep 1;done`

+ `x=1;while true; do echo $x;x=$(($x+1));sleep 1;done`

## shortcut
+ `ctrl + b`
    + `d` detach
    + `x` kill
    + `[`  scroll mod
        + `up/down` scroll
        + `q` quit scroll mode

<!-- copy mode -->
+ `ctrl + b` + `[` copy mode
    + `ctrl + s`+ paste string + `enter` search string
        + `n` next word
        + `shift + n` forward word
    + `shift + alt + ,` go to top

## tips
+  emacs mode vs vi mode

## ref
+ [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)
+ [Everything you need to know about tmux – Status Bar](https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/)
+ [How do I scroll in tmux?](https://superuser.com/questions/209437/how-do-i-scroll-in-tmux)
+ [tmux shortcuts & cheatsheet](https://gist.github.com/MohamedAlaa/2961058)