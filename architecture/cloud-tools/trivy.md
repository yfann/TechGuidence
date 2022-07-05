
## install 
<!-- for WSL -->
+ ` wget https://github.com/aquasecurity/trivy/releases/download/v0.29.2/trivy_0.29.2_Linux-64bit.deb`
+ `sudo dpkg -i trivy_0.29.2_Linux-64bit.deb`

## cmd
+ `trivy image docker.elastic.co/beats/filebeat-oss:7.12.1`

## ref
+ [trivy](https://github.com/aquasecurity/trivy)
+ [documents](https://aquasecurity.github.io/trivy/v0.29.2/)