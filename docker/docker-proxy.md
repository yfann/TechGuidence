
## docker pull proxy

<!-- linux -->
+ `mkdir /etc/systemd/system/docker.service.d`
+ `touch /etc/systemd/system/docker.service.d/http-proxy.conf`
+ `sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf`
```cfg
[Service]
Environment="HTTP_PROXY=...." "HTTPS_PROXY=..."  "NO_PROXY=localhost,127.0.0.0/8"
```
   + `sudo systemctl daemon-reload`
   + `sudo systemctl restart docker`

+ ` sudo systemctl show docker --property Environment`

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
     "httpProxy": "http://....",
     "httpsProxy": "http://....",
     "noProxy": "*.test.example.com,.example2.com,127.0.0.0/8,...."
   }
 }
}
```
<!-- 方式二 -->
+ `docker build --build-arg http_proxy=.... --build-arg https_proxy=.... .`
	+ build中拉取第三方库的代理,例如 go get ....

+ `ENV HTTP_PROXY="http://...."` Dockerfile中设置

+ `docker run --env HTTP_PROXY="....." ...`


## test
+ `docker pull hello-world`

## ref

+ [docker(包括WSL2)如何配置Proxy](https://zhuanlan.zhihu.com/p/427589367)
+ [Configuring Docker For Use With a Proxy](https://movidius.github.io/ncsdk/docker_proxy.html)
+ [Set-up proxy settings in CentOS and Docker Installation](https://docs.expertflow.com/chat/3.16/hybrid-chat-deployment/docker-based-deployment/set-up-proxy-settings-in-centos-and-docker-installation)