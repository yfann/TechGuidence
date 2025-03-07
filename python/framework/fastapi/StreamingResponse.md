# fastapi StreamingResponse 
+ 文件流
+ 视频流
+ 下载文件
## code

+ 持续返回数据
```python
from fastapi import FastAPI
from starlette.responses import StreamingResponse
import time
import asyncio

app = FastAPI()

async def text_stream():
    for i in range(5):
        yield f"Chunk {i}\n"  # 每次返回一小段数据
        await asyncio.sleep(1)  # 模拟慢速数据流

@app.get("/stream")
def stream_text():
    return StreamingResponse(text_stream(), media_type="text/plain")


# http://127.0.0.1:8000/stream
# 每秒返回一行
```

+ 下载文件
```python
from fastapi.responses import StreamingResponse

def file_iterator(file_path, chunk_size=1024 * 1024):  # 每次读取 1MB
    with open(file_path, "rb") as f:
        while chunk := f.read(chunk_size):
            yield chunk  # 逐块返回数据

@app.get("/download")
def download_file():
    file_path = "large_file.zip"
    return StreamingResponse(file_iterator(file_path), media_type="application/octet-stream", headers={"Content-Disposition": "attachment; filename=large_file.zip"})

```

## 原理
+ 服务器异步迭代数据，每次发送一个 chunk，直到数据流结束。
    + async generator
        + 异步环境生成数据，不阻塞事件循环
        + `async for`遍历`async yield`生成的数据
    + HTTP Chunked Transfer Encoding（分块传输编码）
        + header: 
            + Transfer-Encoding: chunked
        + 不需要计算Content-length
+ code
```python
import asyncio

async def async_generator():
    for i in range(5):
        await asyncio.sleep(1)  # 模拟异步 I/O
        yield i  # 逐步返回数据

async def main():
    async for num in async_generator():  # 异步遍历
        print(num)

asyncio.run(main())

```