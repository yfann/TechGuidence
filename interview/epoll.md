# I/O Multiplexing
+ 是指在一个程序中通过一个线程（或少量线程）同时监控多个文件描述符（或网络连接），从而高效处理多个I/O操作的技术。常用于处理多客户端连接的网络服务。

+ I/O多路复用
    + 多路
        + 多个IO事件
        + 多个待服务目标
    + 复用
        + 一个线程处理多个IO事件

+ 处理同一个事件循环中的多个I/O事件


## 类型
+ select：

最早的IO多路复用机制，允许程序同时监视多个文件描述符的状态变化。
缺点是每次调用都需要遍历所有文件描述符，并且有最大文件描述符数量限制（FD_SETSIZE）。

+ poll：

和select类似，但去除了文件描述符数量的限制，文件描述符用动态数组表示。
依然需要遍历整个描述符集合。

+ epoll（Linux特有）：

相比于select和poll更高效，epoll通过事件通知机制，只在文件描述符的状态发生变化时返回，避免了不必要的遍历。
适合处理大量并发连接的场景（如高并发的网络服务器）。

+ kqueue（FreeBSD、macOS等系统上）：

与epoll类似，性能较高。

## 场景
+ O多路复用可以极大地提高系统的并发处理能力，尤其适合大量连接但单次I/O操作数据量不大的场景。
+ 网络服务器：如Nginx和Redis等高性能服务器都使用了IO多路复用来处理大量并发连接。
+ 事件驱动系统：游戏服务器、聊天应用等经常使用此技术来管理大量客户端的连接和消息传递。

## ref
+ [如何实现一个用户态epoll的原理](https://zhuanlan.zhihu.com/p/539363622)
+ [Go netpoll I/O 多路复用构建原生网络模型之源码深度解析](https://www.infoq.cn/article/boeavgkiqmvcj8qjnbxk)
+ [Go netpoll大解析](https://zhuanlan.zhihu.com/p/498802766)
+ [Go netpoll （下篇）- 数据接收发送和关闭](https://mp.weixin.qq.com/s?__biz=MzA4ODg0NDkzOA==&mid=2247508138&idx=1&sn=096de87cb24508008fd1c3145f4a6901&chksm=90211f4fa75696595ae528957e584dc2df93dfe995be8206319ff4f6a2dc8fdf18016777848e&mpshare=1&scene=1&srcid=0616s1a0K7jQ9LYYM5GvWBWm&sharer_sharetime=1686967189025&sharer_shareid=b6d576f5ca6dc5821068706be517177f&exportkey=n_ChQIAhIQD7IZic%2F5Z5r04YsHNb%2BtpRKZAgIE97dBBAEAAAAAAIO%2FLjcaZS0AAAAOpnltbLcz9gKNyK89dVj0urEzB7EoSBpDwPo5PGb%2Bh%2Bl%2FOo7i%2BfBnIplF6bBhWs2GRfVUThLrXtI18CZlLt1YddloJ54XmrZgTmLO8sEEvGEPbDJUTrqt4x46ptTylA7gvUZ6lSTrnX%2FvsOCiMGjwiWz0Du%2BMhZUu8qqQ30KtirAjSfYW%2FHzNPpu1cqPFVwj5Gt2A6M9w8T3Xeao%2BTjuhu13%2B%2F%2FSCzibm99AtXiVE2spaAstzxrl1FPXWnbidzUvVuBNrovLVUZ1tlKtpg353KB5vt2xrlMYGyz7s9jsDyIsU39lRCE%2Ft26ZRUCtPcitNiPrAxJfG9JcZfmWI7BpcLj2B&acctmode=0&pass_ticket=P13z7EjHFVyDp4ESaWNTDEUg0kPFbYEE1JvIygvsMIPKvB1lOLTzrAv3DUyUTxfF&wx_header=0#rd)
+ [万字解析 golang netpoll 底层原理](https://zhuanlan.zhihu.com/p/721422268)