
## jupyter-lab
+ `pip3 install jupyterlab`
+ `jupyter-lab`


##  tips
+ `<obj>?`  查看内置对象
+ history  `_ __ ___` 前三次的输出，`_i __i ___i` 前三次的输入, `_n`第n次的输出, `_in`第n次的输入
+ tab自动补全
+ `%run <xxx.py>` 运行脚本文件
+ `%timeit <code>`  `%timeit [x*x for x in range(1000000)]` 测量代码的运行时间
+ `%debug`
+ `%pylab` 激活Numpy,matplotlib
+ `%lsmagic` 查看所有magic

+ `%debug` `exit()`  进入退出debug

## 快捷键

- `dd` 删除选中的cell
    + `shift+click`+`dd` del all
    + `z` 撤销删除

+ `shift + enter` run cell


## plugin

+ [nbdev](https://github.com/fastai/nbdev/)
    - 运行在jupyter notebook中导出lib,方便在不同环境中重用lib

## ref
+ [official ipython](https://ipython.org/)
+ [学习IPython进行交互式编程和数据可视化ipython教程](https://itacey.gitbooks.io/learning_ipython/content/%E7%AC%AC%E9%9B%B6%E7%AB%A0.html)
+ [ipython doc](http://ipython.readthedocs.io/en/stable/interactive/tutorial.html)
+ [jupyter notebook](https://jupyter-notebook.readthedocs.io/en/stable/notebook.html)
+ [jupyter notebook 快捷键2](http://maxmelnick.com/2016/04/19/python-beginner-tips-and-tricks.html)
+ [jupyterlab](https://mp.weixin.qq.com/s/U0GtZkc9a7xZhy8EgVXW2w)
+ [首款 Jupyter 官方可视化 Debug 工具，JupyterLab 未来可默认支持 Debug](https://zhuanlan.zhihu.com/p/120215615)