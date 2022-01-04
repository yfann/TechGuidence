
## cmd

+ `cp -r /home/packageA/* /home/cp/packageB/`
    + copy 文件夹里的内容

+ `cp -r /home/packageA /home/packageB`
    + copy 文件夹

+ `df -h` 查看目前文件系统的可用空间
    + `df -T`
    
+ `du -h  <your_dest_dir>`
+ `tee`
    + 读取标准输出到文件
    + `date | tee >test.txt`
+ `rm -rf <folder>` -r递归 -f不提示

## copy files from a pod

+ `kubectl cp <default/POD_NAME:bin/FILE_NAME> </Users/username/FILE_NAME>`
    + `kb cp keycloak-0:opt/bitnami/keycloak/themes .`