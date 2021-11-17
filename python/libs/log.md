

## logging(标准库)

+ 建议为程序中的每个模块都创建logger
    + logger = logging.getLogger(__name__)
        + 每行日志带有模块名,否则显示root


+ logging.basicConfig(...） 创建logger

+ fileConfig(...)

+  dictConfig(...)

+ sys.excepthook() 处理没有捕获的异常
    + sys.stderr
        + for unhandled exception

+ traceback.format_exc()
    + 打印trace

+ logger
     + logging.getLogger(...)  通过名称获取日志实例,默认root

+ Handler
    + 日志的目的地

+ Formatter
    + txt
    + JSON

## ref

+ [How to collect, customize, and centralize Python logs](https://www.datadoghq.com/blog/python-logging-best-practices/)
+ [python-json-logger](https://github.com/madzak/python-json-logger)
+ [Python标准库 - logging模块 学习日志](https://www.jianshu.com/p/289477786a66)