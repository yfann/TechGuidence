# epoll

+ I/O多路复用
    + 多路
        + 多个IO事件
    + 复用
        + 一个线程处理多个IO事件

+ 处理同一个事件循环中的多个I/O事件


## ref
+ [如何实现一个用户态epoll的原理](https://zhuanlan.zhihu.com/p/539363622)
+ [Go netpoll I/O 多路复用构建原生网络模型之源码深度解析](https://www.infoq.cn/article/boeavgkiqmvcj8qjnbxk)
+ [Go netpoll大解析](https://zhuanlan.zhihu.com/p/498802766)
+ [Go netpoll （下篇）- 数据接收发送和关闭](https://mp.weixin.qq.com/s?__biz=MzA4ODg0NDkzOA==&mid=2247508138&idx=1&sn=096de87cb24508008fd1c3145f4a6901&chksm=90211f4fa75696595ae528957e584dc2df93dfe995be8206319ff4f6a2dc8fdf18016777848e&mpshare=1&scene=1&srcid=0616s1a0K7jQ9LYYM5GvWBWm&sharer_sharetime=1686967189025&sharer_shareid=b6d576f5ca6dc5821068706be517177f&exportkey=n_ChQIAhIQD7IZic%2F5Z5r04YsHNb%2BtpRKZAgIE97dBBAEAAAAAAIO%2FLjcaZS0AAAAOpnltbLcz9gKNyK89dVj0urEzB7EoSBpDwPo5PGb%2Bh%2Bl%2FOo7i%2BfBnIplF6bBhWs2GRfVUThLrXtI18CZlLt1YddloJ54XmrZgTmLO8sEEvGEPbDJUTrqt4x46ptTylA7gvUZ6lSTrnX%2FvsOCiMGjwiWz0Du%2BMhZUu8qqQ30KtirAjSfYW%2FHzNPpu1cqPFVwj5Gt2A6M9w8T3Xeao%2BTjuhu13%2B%2F%2FSCzibm99AtXiVE2spaAstzxrl1FPXWnbidzUvVuBNrovLVUZ1tlKtpg353KB5vt2xrlMYGyz7s9jsDyIsU39lRCE%2Ft26ZRUCtPcitNiPrAxJfG9JcZfmWI7BpcLj2B&acctmode=0&pass_ticket=P13z7EjHFVyDp4ESaWNTDEUg0kPFbYEE1JvIygvsMIPKvB1lOLTzrAv3DUyUTxfF&wx_header=0#rd)