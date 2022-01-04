
# linux install

+ install rpm
    + `sudo rpm -i sample_file.rpm`
    + `sudo yum localinstall sample_file.rpm`

## linux install go
+ `curl -LO  https://golang.org/dl/go1.15.2.linux-amd64.tar.gz`
+ `sudo tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz`
+ `export PATH=$PATH:GOPATH/bin`
+ `go version`
+ `go env -w GO111MODULE=on`
+ `go env -w GOPROXY=https://goproxy.cn,direct`

## linux install kustomize
+ download https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh
+ chmod +x ./install_kustomize.sh 
+ sudo mv kustomize /usr/local/bin

## install helm
```sh
curl -LO https://github.com/helm/helm/releases/tag/v3.5.0
# 解压tar
tar -xvf helm-v2.14.3-linux-amd64.tar.gz
sudo cp linux-amd64/helm /usr/local/bin/
```

## install kuttl
+ https://github.com/kudobuilder/kuttl/releases
    + kubectl-kuttl_0.8.0_linux_x86_64
+ sudo chmod +x kubectl-kuttl_0.8.0_linux_x86_64
+ sudo mv kubectl-kuttl_0.8.0_linux_x86_64 /usr/local/bin/kubectl-kuttl
+ `kubectl kuttl version`

## install procps
+ `apt-get update`
+ `apt-get install procps`


## install curl
+ `apk update`
+ `apk add curl jq`

## ref
+ `ls -l` 查看权限


# Centos

## yum
+ RPM package



## ref

+ [How to Install an RPM File On Linux OS (CentOS, RHEL, & Fedora)](https://phoenixnap.com/kb/how-to-install-rpm-file-centos-linux)
