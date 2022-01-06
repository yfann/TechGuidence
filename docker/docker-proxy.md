
## docker pull proxy

<!-- linux -->

+ `sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf`
```cfg
[Service]
Environment="HTTP_PROXY=http://211.69.198.232:8118"
```
   + `sudo systemctl daemon-reload`
   + `sudo systemctl restart docker`

<!-- WSL2 -->

+ `vi /etc/default/docker`

## 容器内部proxy,访问外网

<!-- 方式一 -->
+ `~/.docker/config.json`
```json
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://211.69.198.232:8118",
     "httpsProxy": "http://211.69.198.232:8118",
     "noProxy": "*.test.example.com,.example2.com,127.0.0.0/8,211.69.198.232"
   }
 }
}
```
<!-- 方式二 -->


## ref

+ [docker(包括WSL2)如何配置Proxy](https://zhuanlan.zhihu.com/p/427589367)
+ [Configuring Docker For Use With a Proxy](https://movidius.github.io/ncsdk/docker_proxy.html)