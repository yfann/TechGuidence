## env(python虚拟环境)

+ `python3 -m venv /path/to/new/virtual/environment`
    + 创建虚拟环境

+ ` venv\Scripts\activate`
    + 激活虚拟环境
    + powershell: `./Scripts/Activate.ps1`

+ `deactivate` 退出

## python-dotenv
+ 存储环境变量
+ `.env`
+ settings.py

## requirements

+ `pip freeze > requirements.txt`
+ `pip install -r requirements.txt`

## virtualenv
+ `python3 -m pip install --user virtualenv`
    + `pip install virtualenv`
```sh
virtualenv env
. env/bin/activate
pip install -r requirements.txt
```

+ `virtualenv [env name]`
    + `virtualenv --no-site-packages [env name]` 创建干净的环境，不复制助环境的包
+ `virtualenv --version`

## ref

+ [venv --- 创建虚拟环境](https://docs.python.org/zh-cn/3/library/venv.html)
+ [virtualenv](https://www.liaoxuefeng.com/wiki/1016959663602400/1019273143120480)
+ [Python 虚拟环境 看这一篇就够了](http://www.justdopython.com/2020/05/26/python-virtualenv/)
+ [Pipenv & Virtual Environments](https://docs.python-guide.org/dev/virtualenvs/)