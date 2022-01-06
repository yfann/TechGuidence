
## install docker to WSL2

+ `sudo apt autoremove'`
+ `sudo apt install docker`



## uninstall

```sh
dpkg -l | grep -i docker

sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
```

## ref

+ [WSL2使用笔记](https://blog.nediiii.com/wsl2-note/)
+ [Run Docker in WSL (Windows 10/11) without Docker Desktop](https://medium.com/geekculture/run-docker-in-windows-10-11-wsl-without-docker-desktop-a2a7eb90556d)
+ [Windows子系统 (WSL2) + Docker 环境准备（含代理配置）](https://blog.csdn.net/Kidand/article/details/119207728)