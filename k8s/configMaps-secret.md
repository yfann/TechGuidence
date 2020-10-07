## config app

### command-line arguments

+ Dockerfile
    + entrypoint
        + executable invoked when contianer is started
    + CMD
        + specify the arguments that get passed to the entrypoint
    + `docker run <img>`
        + `docker run <img> <arguments>`override whatever's set under CMD in the dockerfile
    + shell form
        + shell 中运行
        + 容器中会有个shell进程为主进程
        + `ENTRYPOINT node app.js`
    + exec form
        + 直接运行
        + `ENTRYPOINT ["node", "app.js"]`
    + `docker exec 4675d ps x`
        + 查看进程
```yaml
FROM ubuntu:latest
RUN apt-get update ; apt-get -y install fortune
ADD fortuneloop.sh /bin/fortuneloop.sh
ENTRYPOINT ["/bin/fortuneloop.sh"]                 ❶
CMD ["10"]                                         ❷
```
    + ❶ exec form
    + ❷ default argument for the executable

+ Overriding ENTRYPOINT and CMD
```yaml
kind: Pod
spec:
  containers:
  - image: some/image
    command: ["/bin/command"]
    args: ["arg1", "arg2", "arg3"]
```

### environment variable
+ container level,not pod level
```yaml
kind: Pod
spec:
 containers:
 - image: luksa/fortune:env
   env:                            ❶
   - name: INTERVAL                ❶
     value: "30"                   ❶
   name: html-generator
...
```

+ 引用变量
```yaml
env:
- name: FIRST_VAR
  value: "foo"
- name: SECOND_VAR
  value: "$(FIRST_VAR)bar"
```
### mounting configuration files with volume

### configmap
+ read configMap from environment variables
+ configMap volumes
+ pass ConfigMap to command-line args by $(ENV_VAR)

