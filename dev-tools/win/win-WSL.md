
## cmd
+ `wsl -l -v`
    + 列出安装的子系统<Distro>
+ `wsl --set-version Ubuntu-20.04 2`
+ `wsl --set-default-version 2`

+ `wsl --shutdown`

## tips
+ `\\wsl$` (window 访问目录)
+ run as admin

+ windows ---> wsl localhost
    + wsl -----/----> windows localhost
        + windows firewall

+ .wslconfig
    + 限制Vmmem 进程为4G
```
[wsl2]
memory=4GB
swap=0
localhostForwarding=true
```

+ `wsl --shutdown` 重启



## docker-wsl

+ docker desktop
    + enable use the WSL 2 based engine

+ `wsl -l -v` check if wsl is v2

+ `wsl.exe --set-default-version 2` if it's not v2 swith to v2
    + `wsl.exe --set-version (distro name) 2`

## ref
+ [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
+ [WSL 使用指南——03 避免的坑](https://zhuanlan.zhihu.com/p/34885187)

+ [docker for wsl2](https://docs.docker.com/docker-for-windows/wsl/)


<!-- issues -->
+ [Access windows localhost from wsl2](https://devdojo.com/mvnarendrareddy/access-windows-localhost-from-wsl2)
    +  public profile of Windows Defender Firewall
+ [wsl to windows localhost](https://github.com/microsoft/WSL/issues/5211)
+ [Unable to accessing Windows applications from WSL](https://github.com/microsoft/WSL/issues/4793#issuecomment-577232999)
+ [WSL 内存过高](https://zhuanlan.zhihu.com/p/356394268)