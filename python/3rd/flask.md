
## modules
+ flask-cors  跨域
```py
from flask_cors import *
app = Flask(__name__)
CORS(app, resources=r'/*')
```

## ref
+ [Building a simple REST API with Python and Flask](https://medium.com/@onejohi/building-a-simple-rest-api-with-python-and-flask-b404371dc699)
+ [欢迎使用 Flask](http://docs.jinkan.org/docs/flask/)
+ [在 VSCode中使用Flask官方教程](https://zhuanlan.zhihu.com/p/40706149)