
## linux install go
+ `curl -LO  https://golang.org/dl/go1.15.2.linux-amd64.tar.gz`
+ `sudo tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz`
+ `export PATH=$PATH:/usr/local/go/bin`
+ `go version`
+ `go env -w GO111MODULE=on`
+ `go env -w GOPROXY=https://goproxy.cn,direct`

## linux install kustomize
+ download https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh
+ chmod +x ./install_kustomize.sh 
+ sudo mv kustomize /usr/local/bin