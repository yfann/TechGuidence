## userns-remap
+ 把node中的一个普通用户(只有普通权限的用户)映射到container中的 root 用户
    + 用户在user namespace中有root权限

+ mapped UID 对应ns中(container中)的UID为(0~65536)

+ `/etc/subuid`
  + `testuser:231072:65536`
    + host uid 231072 对应ns中(container中)的 uid 0(root)
    + host uid 231073 对应ns中(container中)的 uid 1
    + 65536 个从属用户
+ `/etc/subgid`

+ privilege时 process在host上以mapped UID运行，在host上没有特权

+ mapping可以设置多个，取前5个
  + ranges do not overlap

## cmd

+ `id <user>`
  + `id dockremap`

## tips

+ docker提供`--privileged`
    + 使container以root身份访问host
    + 它有特定的用例，例如 Docker-in-Docker，其他 CI/CD 工具要求（从 Docker 容器内部需要 Docker 守护程序）以及需要极端网络的地方。
```yaml
spec:
  containers:
  - name: nginx
    image: nginx
    securityContext:
      privileged: true
```

+ container 默认以`root`运行
    + 修改默认用户
        + Dockerfile
        ```sh
        ....
        USER test
        ``` 
        + `docker run -it --user 4000 postgres sh`

+ --userns=host
  + docker启动时，container disable ns


## issues

+ container id cannot be mapped to a host id
  + The solution is to change the owner of those files to root:root.
    + 更改那些文件的owner和group为 root:root

## ref
+ [Docker中使用userns-remap做用户命名空间](https://blog.csdn.net/zyy247796143/article/details/114386484)
+ [Isolate containers with a user namespace](https://docs.docker.com/engine/security/userns-remap/)

+ [Docker 和 Kubernetes：root 与特权](https://cloud.tencent.com/developer/article/1815867)