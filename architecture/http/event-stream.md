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

## ref
+ [EventSource](https://developer.mozilla.org/en-US/docs/Web/API/EventSource)
+ [Using server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
+ [How streaming LLM APIs work](https://til.simonwillison.net/llms/streaming-llm-apis)