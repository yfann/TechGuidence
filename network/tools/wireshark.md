# wireshark


## display filter
+ `tcp.port == 80`
+ Display filters on the other hand do not have this limitation and you can change them on the fly.

## capture filter
+ `tcp port 80`
+ Capture filters are set before starting a packet capture and cannot be modified during the capture. 

## tips

+ 相同子网直接发给对方
+ 不同子网通讯要通过网关



## ref

+ [CaptureFilters](https://wiki.wireshark.org/CaptureFilters)
+ [display filter](https://blog.csdn.net/wojiaopanpan/article/details/69944970)


+ [《Wireshark网络分析就这么简单》](https://github.com/JCGit/books/blob/master/%E3%80%8AWireshark%E7%BD%91%E7%BB%9C%E5%88%86%E6%9E%90%E5%B0%B1%E8%BF%99%E4%B9%88%E7%AE%80%E5%8D%95%E3%80%8B.pdf)
+ [Wireshark: 分析 TCP 四次挥手](https://veryitman.com/2018/12/16/Wireshark-%E5%88%86%E6%9E%90-TCP-%E5%9B%9B%E6%AC%A1%E6%8C%A5%E6%89%8B/)