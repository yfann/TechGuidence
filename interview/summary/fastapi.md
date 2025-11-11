# fastapi

## 后台线程执行阻塞函数
+ asyncio.to_thread()
    + Python 3.9+
+ run_in_threadpool
    + 内部调了asyncio.to_thread()