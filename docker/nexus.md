

## cmd

+ `docker run -d -p 8081:8081 -p 9001:9001 --name nexus sonatype/nexus3`
    + `curl http://localhost:8081/`
    + `docker exec -it ef39f0cd6bdc cat /nexus-data/admin.password`

<!-- mount data -->
+ `docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3`
    + `mkdir /some/dir/nexus-data && chown -R 200 /some/dir/nexus-data`



## tips
+ admin/admin123


## setup private reigistry

+ turn off proxy `cat /etc/default/docker`
    + `sudo mv /etc/default/docker /etc/default/docker-bak`

+ etc/docker/daemon.json
```json
{
  "insecure-registries" : ["myregistrydomain.com:9001"]
}
```

+ Nexus create repo
    + docker(host)
        + 设置http端口(例如：9001)
            + docker启动的时候要暴露9001
            + 9001加入insecure-registries

+ `docker login localhost:9001`
+ `docker tag <img> localhost:9001/<repo>/<img>`
    + `docker push ...`

## ref

+ [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/)
+ [How to upload and download docker images using nexus registry/repository?](https://www.devopsschool.com/blog/how-to-upload-and-download-docker-images-using-nexus-registry-repository/)