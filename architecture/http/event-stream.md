# Server-Sent Events(SSE)
+ ` content-type: text/event-stream`
+ HTTP 协议中用于服务器向客户端推送实时数据的一种方式
+ 单向
+ 基于http，可以用js监听event
+ EventSource 
    + 浏览器API
    + 用于接收server push
```js
const eventSource = new EventSource("http://localhost:3000/events");

eventSource.onmessage = (event) => {
    console.log("收到消息:", event.data);
};
```

## event-source-polyfill
+ 对不支持SSE浏览器的替代方案

## SSE vs HTTP Chunked Transfer Encoding
+ 都是标准http协议
+ SSE
    + 自动重连
    + 持续不断发数据
    + EventSource API
    + content-type: text/event-stream
    + 场景
        + 实时推送
        + 服务端消息
        + 股票
+ HTTP Chunked Transfer Encoding
    + 不会重连
    + 把response分割多个块发送
    + 标准http api
    + 任意数据格式
    + 场景
        + 大文件，优化响应

## 超时处理
+ 客户端重连(会丢数据)
```js
eventSource.onerror = () => {
    console.log("SSE 连接错误，尝试重连...");
    setTimeout(() => {
        eventSource.close();
        eventSource = new EventSource("/stream");  // 重新连接
    }, 3000);  // 3 秒后重试
};

```

+ 发送heartbeat
```py
async def event_stream():
    while True:
        task = asyncio.create_task(getdata())  # 异步任务执行 getdata()
        while not task.done():  # 任务未完成，发送心跳
            yield ":ping\n\n"
            await asyncio.sleep(5)  # 每 5 秒发送一次心跳

        result = await task  # 任务完成，获取数据
        yield f"data: {result}\n\n"  # 发送正常数据
```
## ref
+ [EventSource](https://developer.mozilla.org/en-US/docs/Web/API/EventSource)
+ [Using server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
+ [How streaming LLM APIs work](https://til.simonwillison.net/llms/streaming-llm-apis)