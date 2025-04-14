# Uvicorn 
+ Uvicorn 是一个基于 asyncio 和 uvloop 的 超高性能、异步 Python Web 服务器，它实现了 ASGI（Asynchronous Server Gateway Interface） 协议。

## 网关协议
+ WSGI(Web Server Gateway Interface)
    + Flask / Django
    + 只支持http
+ ASGI(Asynchronous Server Gateway Interface)
    +  原生支持 async/await
    + FastAPI / Starlette / Django Channels
    + 	支持 HTTP、WebSocket、Lifespan