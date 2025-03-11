# celery
+ Celery 是一个分布式任务队列，用于处理异步任务
+ Celery 使用消息中间件（如 RabbitMQ 或 Redis）来协调任务和工作者。

## worker
+ Concurrency mode
    + 进程
    + 线程
    + Eventlet
    + Gevent
+ remote control
    + 通过高优先级队列发消息到某个worker来改变worker的行为(包括runtime)
+ revoking tasks
    + 撤销任务
## task
+ 任何可执行的方法或对象都可以成为任务 (Any callable can be a task.)
```py
@app.task
def hello_world():
  return "Hello I'm a celery task"
```
+ 任务类型
    + 同步
    + 异步
    + 定期
    + 计划
+ AsyncResult

## result backends
+ 存储任务的状态和结果
## ref
+ [理解Celery架构](https://hellowac.github.io/parallel-programming-with-python-zh/chapter7/understanding_celery_architecture/)