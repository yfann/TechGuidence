# jupyter-lab

+ `jupyter-lab`
    + `Esc` command mode
        + `Enter` edit mode
    + `dd` delete cell
        + `ctrl + a` 全选
        + `z` 恢复删除
    + `shift + Enter` 执行并 选中下方cell
        + `ctrl + Enter` 执行当前cell
        + `alt + Enter` 执行当前cell 并下方插入新cell

    + `a` 当前单元格的上方插入 cell
        + `b` 下方插入
        + `x` `c` `v`
    + `shift + up/down` select multipe cells `ctrl + a`
    + `shift + M` merge cell
    + `ctrl + shift + -` split 光标所在处

+ jupyter-lab command
    + `history`
    + `%lsmagic`
        + `%env xxx=xxx`
            + `%who` global vars
        + `%run ./two-histograms.ipynb`
        + ` %load ./hello_world.py` inert code
        + `%store <var>`
            + `%store -r <var>` notebook直接传递变量

## python help

+ `help()`
    + `help(<module>.<function>)`

+ `dir(<module>)`

+ `?<var>` module,method

## ref
+ [Python语法速查](https://wklchris.github.io/Py3-basic.html)
+ [python dict](https://www.w3cschool.cn/python/dict)
+ [devdocs](https://devdocs.io/python~3.9/library/os)
+ [python code example](https://www.programcreek.com/python/)

+ [Jupyter Notebook Shortcuts](https://towardsdatascience.com/jypyter-notebook-shortcuts-bf0101a98330)