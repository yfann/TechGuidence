

## list watch
+ client 和 API server交互时先 list 获取所有资源，再watch差异更新
    + list
        + http短连接
    + watch
        + http长连接
        + 分块传输
+ 当client 和 APIserver断开时
    + 短时间
        + rewatch
    + 长时间
        + relist
+ 异步消息处理