# fastAPI


## cmd
+ `pip install "fastapi[standard]"`
    + `pip install fastapi`
    + `pip install uvicorn`
    + `uvicorn main:app --reload` 

## fastapi-cli
+ `fastapi dev xxx.py`


## docs
+ `/docs`

## 并发
+ 默认是单进程单线程多协程
    + `async def`
+ 当使用`def`而不是`async def`时
    + Starlette 会用 ThreadPoolExecutor 把它扔到线程池中执行。
+ `uvicorn main:app --workers 4`
    + 启动多个进程

+ 最大化并发能力，又需要跑一些同步或 CPU 密集型的任务
    + --workers N + async def
    + 后台任务队列（如 Celery）
    + asyncio.to_thread() 或 run_in_executor() 把阻塞任务扔到线程池

## ref
+ [fastapi](https://fastapi.tiangolo.com/#requirements)