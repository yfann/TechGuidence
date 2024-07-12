# python command line

## python cmd
+ `python -m webbrowser <url>`
+ `python -m http.server <port>`
    + 启动web服务器，以当前目录作为root
+ `python -m json.tool <json file>`
    + 显示json格式
+ `py -m uuid`
+ `py -m base64`
+ `py -m zipfile`
    + `py -m gzip`
    + `py -m tarfile`
+ `py -m sqlite3`



## tips
+ `if __name__ == "__main__"`
    + py script直接运行，而非module导入
+ `python -m <module name>`
    + 以模块方式运行
+ `python xx.py`
    + 直接运行脚本
    + `__name__ == "__main__"`


## ref
+ [Python's many command-line utilities](https://www.pythonmorsels.com/cli-tools/)
+ [Module versus Script in Pythons](https://www.pythonmorsels.com/module-vs-script/)