

+ `tar`
    + `-z` gzip
    + `-j` bzip2
    + `-v` 详细信息
    + `-c` 创建新的档案
    + `-x` 解压
    + `-f` 

+ `tar -zvcf xx.tar.gz xxx` 压缩
    + `tar -zvcf xxx.tar.gz *`
    + `tar --exclude='./bin' --exclude='./data' --exclude='./images' --exclude='.git' -zvcf kns .`

+ `tar -zvxf xx.tar.gz` 解压
    + `tar -zvxf ./kns -C ./test`