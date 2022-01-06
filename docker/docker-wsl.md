## Install Docker Engine on Ubuntu(WSL2)
<!-- Uninstall old versions -->
+ `sudo apt-get remove docker docker-engine docker.io containerd runc`

<!-- install docker engine -->
+ [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

<!-- start docker daemon -->
+ `sudo service docker start`

<!-- proxy -->
+ `sudo vi /etc/default/docker`
```sh
export HTTP_PROXY="http://xxx:xxx"
export HTTPS_PROXY="http://xxx:xxx"
export NO_PROXY="localhost,127.0.0.0/8"
```


## ref
<!-- workable for WSL2 -->
+ [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)


<!-- others -->
+ [WSL2使用笔记 docker](https://blog.nediiii.com/wsl2-note/)
+ [Run Docker in WSL (Windows 10/11) without Docker Desktop](https://medium.com/geekculture/run-docker-in-windows-10-11-wsl-without-docker-desktop-a2a7eb90556d)
+ [Windows子系统 (WSL2) + Docker 环境准备（含代理配置）](https://blog.csdn.net/Kidand/article/details/119207728)