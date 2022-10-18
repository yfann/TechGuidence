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

<!-- check,debug -->
+ `sudo systemctl status k3s.service -l`
+ `journalctl -u k3s`
    + `journalctl -u k3s -p err -b`

<!-- uninstall -->
+ `/usr/local/bin/k3s-uninstall.sh`
    + uninstall server node
+ `/usr/local/bin/k3s-agent-uninstall.sh`
    + `kubectl delete node <node name>`
    + uninstall agent node

<!-- intranet install -->

<!-- /etc/rancher/k3s/registries.yaml -->
```yaml
mirrors:
  docker.io:
    endpoint:
      - "http://xxxx"
  docker.elastic.co:
    endpoint:
      - "http://xxxxx"
  opensearchproject:
    endpoint:
     - "http://xxxxx"
```


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

## 日志

+ `/var/log/syslog`

+ `systemctl status k3s.service`

+ `journalctl -u k3s`
    + `journalctl -u k3s --lines=20`

## etcd

<!-- install etcdctl -->
+ `VERSION="v3.5.0"`
+ `curl -L https://github.com/etcd-io/etcd/releases/download/${VERSION}/etcd-${VERSION}-linux-amd64.tar.gz --output etcdctl-linux-amd64.tar.gz`
+ `sudo tar -zxvf etcdctl-linux-amd64.tar.gz --strip-components=1 -C /usr/local/bin etcd-${VERSION}-linux-amd64/etcdctl`

+ `etcdctl --cacert=/var/lib/rancher/k3s/server/tls/etcd/server-ca.crt --cert=/var/lib/rancher/k3s/server/tls/etcd/client.crt --key=/var/lib/rancher/k3s/server/tls/etcd/client.key version`
    + `etcdctl version`
    + `etcdctl put foo bar`
    + `etcdctl get foo`

<!-- etcd -->

## traefik
+ `kubectl describe deploy traefik -n kube-system`
    + /config/traefik.toml
        + /var/lib/rancher/k3s/server/manifests/traefik.yaml.
        + `kubectl describe configmap traefik -n kube-system`

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
    + If no `K3S_TOKEN` is defined, the first K3s server will generate a random one. The result is part of the content in `/var/lib/rancher/k3s/server/token`. For example, K1070878408e06a827960208f84ed18b65fa10f27864e71a57d9e053c4caff8504b::server:df54383b5659b9280aa1e73e60ef78fc, where df54383b5659b9280aa1e73e60ef78fc is the `K3S_TOKEN`.

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

<!-- etcd -->
+ [etcd](https://etcd.io/docs/v3.5/install/)
+ [k3s etcd commands](https://gist.github.com/superseb/0c06164eef5a097c66e810fe91a9d408)


<!-- practice -->
+ [Install HA k3s cluster with external etcd and virtual IP](https://github.com/pmvrolijk/k3s-cluster)
+ [PyratLabs/ansible-role-k3s](https://github.com/PyratLabs/ansible-role-k3s)

<!-- release -->
+ [k3s release](https://github.com/k3s-io/k3s/releases)


<!-- traefik -->
+ [在k3s中启用其自带ingress——traefik的web-ui](https://www.jianshu.com/p/0040e8bd6d1e)
+ [ Traefik Ingress controller](https://rancher.com/docs/k3s/latest/en/networking/)
    + [helmchartconfig](https://rancher.com/docs/k3s/latest/en/helm/#customizing-packaged-components-with-helmchartconfig)
+ [traefik doc](https://doc.traefik.io/traefik/)
+ [traefik-helm-chart](https://github.com/traefik/traefik-helm-chart/tree/master/traefik)
<!-- traefik samples -->
+ [Ingress with Traefik on K3s](https://itnext.io/ingress-with-treafik-on-k3s-53db6e751ed3)
+ [A Guide to K3s Ingress Using Traefik with NodePort](https://levelup.gitconnected.com/a-guide-to-k3s-ingress-using-traefik-with-nodeport-6eb29add0b4b)
+ [Directing Kubernetes traffic with Traefik](https://opensource.com/article/20/3/kubernetes-traefik)

<!-- install k3s-->
+ [k3d](https://k3d.io/v5.4.6/)
+ [k3sup](https://github.com/alexellis/k3sup)