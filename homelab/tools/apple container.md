# apple container
## cmd
+ `container --help`
    + `container i --help`

<!-- system -->
+ `container system start`
    + `container system stop`
+ `container system status`
+ `container system restart`

<!-- image -->
+ `container build --tag web-test --file Dockerfile .`
+ `container images list`
+ `container images push docker.io/fido/web-test:latest`
    + `container registry login docker.io`

<!-- container -->
+ `container ls -a`
    + `container list --all`
+ `container run --name my-web-server --detach --rm web-test`
    + `--detach`
        + 后台运行
    + `--rm`
        + 停止后删除
+ `container exec my-web-server sh` 
+ `container stop <container name>`


+ ``

## local DNS
+ container includes an embedded DNS service 
```bash
sudo container system dns create test
# create domain test
container system dns default set test
# use test as default
```

## ref
+ [Tutorial](https://github.com/apple/container/blob/main/docs/tutorial.md)
+ [apple container](https://github.com/apple/container?tab=readme-ov-file)
+ [uninstall container](https://github.com/apple/container/blob/main/scripts/uninstall-container.sh)