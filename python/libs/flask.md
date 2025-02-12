
# Flask

+ `flask run`

## modules
+ flask-cors  跨域
```py
from flask_cors import *
app = Flask(__name__)
CORS(app, resources=r'/*')
```

## vscode debug

+ Run and Debug -> launch.json(flask)

## ref
+ [Building a simple REST API with Python and Flask](https://medium.com/@onejohi/building-a-simple-rest-api-with-python-and-flask-b404371dc699)
+ [欢迎使用 Flask](http://docs.jinkan.org/docs/flask/)
+ [在 VSCode中使用Flask官方教程](https://zhuanlan.zhihu.com/p/40706149)

+ [Flask快速入门](http://docs.jinkan.org/docs/flask/quickstart.html)

+ [应用错误处理](https://dormousehole.readthedocs.io/en/latest/errorhandling.html)
+ [Flask项目异常处理机制](https://www.jianshu.com/p/ad147577ce85)