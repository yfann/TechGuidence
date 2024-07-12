# jupyter-lab


## install
+ `pip install jupyterlab` 管理员模式安装
    + `pip show jupyterlab`

+ `jupyter-lab <path>`



## shortcut

<!-- command mode -->
+ `Esc` command mode

+ `dd` delete cell
    + `ctrl + a` 全选
    + `z` 恢复删除


+ `ctrl + Enter` 执行当前cell
    + `shift + Enter` 执行并 选中下方cell
    + `alt + Enter` 执行当前cell 并下方插入新cell

+ `a` 当前单元格的上方插入 cell
    + `b` 下方插入
    + `x` `c` `v`

+ `shift + up/down` select multipe cells `ctrl + a`
+ `shift + M` merge cell
+ `ctrl + shift + -` split 光标所在处

<!-- edit mode -->
+ `Enter` edit mode

+ `ctrl + [/]`缩进














## magic
+ `history`
+ `%lsmagic`
    + `%env xxx=xxx`
        + `%who` global vars
    + `%run ./two-histograms.ipynb`
    + ` %load ./hello_world.py` inert code
    + `%store <var>`
        + `%store -r <var>` notebook直接传递变量

## ref
+ [Jupyter Notebook Shortcuts](https://towardsdatascience.com/jypyter-notebook-shortcuts-bf0101a98330)