
# HTTP

## Method

### Post

Content-Type:
+ application/x-www-form-urlencoded
+ multipart/form-data
+ application/json
+ text/xml

## Concept

+ [PRG](https://en.wikipedia.org/wiki/Post/Redirect/Get)
+ [HTTP Tunnel](https://en.wikipedia.org/wiki/HTTP_tunnel)
+ [Proxy server](https://en.wikipedia.org/wiki/Proxy_server#Web_proxy_servers)


## 缓存

1. 是否使用浏览器缓存：(都设0可以禁用浏览器缓存)

    + Expires(http 1.0 response头部， 通过过期时间判断，客户端服务器可能时间不一致)
    + Cache-control:max-age(http 1.1 response头部, 浏览器在请求完毕时记录本地时间，再次请求时用现在时间减去记录的时间，得到的值与max-age比较)

2. Conditional Validation request：

    当浏览器缓存过期或禁用时，请求相同的资源时会对服务端文件进行更新检测(以下两个头不存在的时候直接返回资源)

    + Last-Modified(response 文件生成时间或最后修改时间,下次请求时会把这个值赋在request `If-Modified-Since`,和服务器文件时间做对比，一样的话返回304)
    + Etag(response MD5值，下次请求时赋在request `If-None-Match`,和服务器文件对比，一样时返回304)


3. Response:

    + 200(from cache/包含response body)
    + 304(响应头，不包含response body)

## header

+ referer  //告诉服务器访问过的上一个网页，可用于防盗链


## ref

+ [content type](http://www.cnblogs.com/liulangmao/p/3889568.html)


+ [keepAlive](https://51write.github.io/2014/04/09/keepalive/)

<!-- https -->
+ [深入理解HTTPS工作原理](https://juejin.cn/post/6844903830916694030)
+ [https](http://www.cnblogs.com/chyingp/p/https-introduction.html)
+ [SSL/TLS](http://www.ruanyifeng.com/blog/2014/02/ssl_tls.html)
+ [OpenSSL 与 SSL 数字证书概念贴](http://seanlook.com/2015/01/15/openssl-certificate-encryption/)