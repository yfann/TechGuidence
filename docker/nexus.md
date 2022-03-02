

## cmd

+ `docker run -d -p 8081:8081 --name nexus sonatype/nexus3`
    + `curl http://localhost:8081/`

+ `docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3`
    + `mkdir /some/dir/nexus-data && chown -R 200 /some/dir/nexus-data`


## setup private reigistry

+ turn off proxy `cat /etc/default/docker`
    + `sudo mv /etc/default/docker /etc/default/docker-bak`

+ etc/docker/daemon.json
```json
{
  "insecure-registries" : ["myregistrydomain.com:5000"]
}
```

## tips
+ admin/admin123

## issues

+ 405

## ref

+ [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/)
+ [How to upload and download docker images using nexus registry/repository?](https://www.devopsschool.com/blog/how-to-upload-and-download-docker-images-using-nexus-registry-repository/)
+ [Docker使用Nexus部署maven私有仓库](https://segmentfault.com/a/1190000020708330)