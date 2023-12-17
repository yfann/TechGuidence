# install docker on CentOS

+ `yum install docker`
+ `service docker start`
+ `docker version`
<!-- change registry -->
+ `vi /etc/docker/daemon.json`
```json
{ "registry-mirrors": "https://registry.docker-cn.com", "live-restore": true }
```
## ref

+ [Install Docker Engine on CentOS](https://docs.docker.com/engine/install/centos/)

+ [Run Docker in WSL (Windows 10/11) without Docker Desktop](https://medium.com/geekculture/run-docker-in-windows-10-11-wsl-without-docker-desktop-a2a7eb90556d)