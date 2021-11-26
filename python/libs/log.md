

## logging(标准库)

+ 创建logger
    + logging.basicConfig(...） 
    + fileConfig(...)
    + dictConfig(...)

+ sys.excepthook() 处理没有捕获的异常
    + sys.stderr
        + for unhandled exception

+ traceback.format_exc()
    + 打印trace


+ Formatter
    + txt
    + JSON

+ `extra`

```py
FORMAT = '%(asctime)s %(clientip)-15s %(user)-8s %(message)s'
logging.basicConfig(format=FORMAT)
d = {'clientip': '192.168.0.1', 'user': 'fbloggs'}
logger = logging.getLogger('tcpserver')
logger.warning('Protocol problem: %s', 'connection reset', extra=d)
```

## logger

+ logging.getLogger(name)  
    + 得到一个logger

+ name 可以为 aa.bb.cc的形式
    + aa.bb 为 aa的子级
    + aa.bb.cc为 aa.bb的子级
    + 继承关系

+ 通过name获取日志实例,不指定name则为root

+ 建议为程序中的每个模块都创建logger
    + logger = logging.getLogger(__name__)
        + 每行日志带有模块名,否则显示root

+ 可以配置多个handler
    + 文件，控制台同时输出

+ `propagate`
    + 如果开启，日志除了写在当前logger的handler中，还会写入父logger的handler中
        + 判断日志级别

## handler

+ 每个handler对应一种输出

## logging.ini



## ref

+ [How to collect, customize, and centralize Python logs](https://www.datadoghq.com/blog/python-logging-best-practices/)
+ [python-json-logger](https://github.com/madzak/python-json-logger)
+ [Python标准库 - logging模块 学习日志](https://www.jianshu.com/p/289477786a66)
+ [python logging继承关系](https://lisongmin.github.io/python-logging-inherit/)
+ [Python 日志打印之logging.config.dictConfig使用总结](https://cloud.tencent.com/developer/article/1772559)