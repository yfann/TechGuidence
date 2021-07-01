
## cmd

+ `cp -r /home/packageA/* /home/cp/packageB/`
    + copy 文件夹里的内容

+ `cp -r /home/packageA /home/packageB`
    + copy 文件夹

## copy files from a pod

+ `kubectl cp <default/POD_NAME:bin/FILE_NAME> </Users/username/FILE_NAME>`
    + `kb cp keycloak-0:opt/bitnami/keycloak/themes .`