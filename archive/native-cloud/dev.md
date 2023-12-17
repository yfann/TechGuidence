##  setup k3s environment
+ `vagrant up`
    + Vagrantfile
+ `vagrant ssh`
+ `curl -sfL https://get.k3s.io | sh - `
+ `sudo su -`


## proxy
<!-- k3s proxy -->
```sh
sudo tee /etc/systemd/system/k3s.service.env > /dev/null << EOF
HTTPS_PROXY=http://[ip]:[port]
HTTP_PROXY=http://[ip]:[port]
EOF

sudo systemctl daemon-reload
sudo systemctl restart k3s
```


## deploy k8s
<!-- dev -->
+ k3d
+ kind
+ Minikube
<!-- production -->
+ kubeadm
+ kubespray
+ kops
+ k3s
+ Rancher RKE2


## ref
+ [k8s 代理问题一站式解决](https://zhuanlan.zhihu.com/p/545327043)
