# user remap
+ 把node中的一个普通用户(只有普通权限的用户)映射到container中的 root 用户
    + 用户在user namespace中有root权限

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
+ 多少container 默认以`root`运行
    + 修改默认用户
        + Dockerfile
        ```sh
        ....
        USER test
        ``` 
        + `docker run -it --user 4000 postgres sh`

## ref
+ [Docker中使用userns-remap做用户命名空间](https://blog.csdn.net/zyy247796143/article/details/114386484)
+ [Isolate containers with a user namespace](https://docs.docker.com/engine/security/userns-remap/)
+ [Docker 和 Kubernetes：root 与特权](https://cloud.tencent.com/developer/article/1815867)