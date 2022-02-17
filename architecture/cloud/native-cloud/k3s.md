# k3s

+ `k3s -v`


## install 
<!-- install k3s server -->
+ `curl -sfL https://get.k3s.io | sh -`
    + `curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s -`
        + /etc/rancher/k3s/k3s.yaml
        + /var/lib/rancher/k3s/server/node-token
<!-- install k3s agent -->
+ `curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -`
    + `/var/lib/rancher/k3s/server/node-token` on server

<!-- install HA k3s with embeded etcd -->
+ `curl -sfL https://get.k3s.io | K3S_TOKEN=SECRET INSTALL_K3S_EXEC="server --cluster-init" sh -`
+ `curl -sfL https://get.k3s.io | K3S_TOKEN=SECRET K3S_URL=https://server1:6443 INSTALL_K3S_EXEC="server" sh -`

<!-- uninstall -->
+ `/usr/local/bin/k3s-uninstall.sh`

## systemctl
<!-- /etc/systemd/system/k3s*.service -->
+ `sudo systemctl status k3s.service`
```sh
k3s server \
  --write-kubeconfig-mode "0644"    \
  --tls-san "foo.local"             \
  --node-label "foo=bar"            \
  --node-label "something=amazing"
```





## tips

+ embedded SQLite used in single-server

+ HA k3s
    + two or more server nodes 
    + external datastore
    + etcd
        + embeded etcd
            + 奇数个server node
            + 每个server node上都有etcd实例
        + external etcd

+ K3S_TOKEN
    + `/var/lib/rancher/k3s/server/node-token` on server node

## ref

+ [K3s - Lightweight Kubernetes](https://rancher.com/docs/k3s/latest/en/)
+ [Architecture](https://rancher.com/docs/k3s/latest/en/architecture/)
<!-- others -->

+ [k3d入门指南：在Docker中运行K3s](https://mp.weixin.qq.com/s?__biz=MzIxMDA5MzA4MQ==&mid=2247484625&idx=1&sn=b29936c27b7dda71fa487dbf041e6c52&chksm=976891a7a01f18b16c423fcf047cc502db46198f05454b642eaf91d56409c0244a304eb522ed&scene=21#wechat_redirect)
+ [这应该是最适合国内用户的K3s HA方案](https://mp.weixin.qq.com/s?__biz=MzIxMDA5MzA4MQ==&mid=2247484297&idx=1&sn=13fb1986fb016444abd10fa99dc01eb6&chksm=976896ffa01f1fe94d07e02fc4cbb95dacb91542fa8334db94b78a26da17fe6b9237b3760860&scene=21#wechat_redirect)
+ [Deploying Rancher on k3s on WSL 2](https://boxofcables.dev/deploying-rancher-on-k3s-on-wsl2/)

<!-- HA -->
+ [Tutorial: Install a Highly Available K3s Cluster at the Edge](https://thenewstack.io/tutorial-install-a-highly-available-k3s-cluster-at-the-edge/)
    + external etcd
+ [install ha k3s with embeded etcd](https://github.com/k3s-io/k3s/issues/1617)