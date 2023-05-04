

## tips
+ http1.0：单工。因为是短连接，客户端发起请求之后，服务端处理完请求并收到客户端的响应后即断开连接。
+ http1.1：半双工。默认开启长连接keep-alive，开启一个连接可发送多个请求。
+ http2.0：全双工，允许服务端主动向客户端发送数据。


## ref
+ [flink](https://nightlies.apache.org/flink/flink-docs-release-1.10/zh/getting-started/)
+ [流式处理新秀Flink原理与实践](https://juejin.cn/post/6844903576691539976)