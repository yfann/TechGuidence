# argoCD

+ git to k8s
+ GitOps（CD）
+ 一个K8s控制器
    + 仓库中的配置为目标状态

## install
<!-- linux -->
+ `curl -sSLO  https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
+ `sudo chmod +x argocd`
+ `sudo mv argocd /usr/local/bin/argocd`

## cmd
+ `argocd login <ARGOCD_SERVER>`
+ `argocd cluster add CONTEXT [flags]`


## SSO

+ role mapping
```yaml
kind: ConfigMap
metadata:
  name: argocd-rbac-cm
data:
   # 必须设置
   policy.default: role:readonly # 为role:admin时，policy.csv会失效，登入用户都为admin
   policy.csv: |
     p, myrole, clusters, get, */*, allow
     g, admin, role:myrole
```


## tips

+ hard refresh
    + 加载更新过的helm

+ CI
    + Jenkins

+ GitOps
    + 程序的交付方式



## ref

+ [ArgoCD 简明教程](https://www.csdn.net/tags/MtTaMg1sODQ2MTA4LWJsb2cO0O0O.html)
+ [argo CD](https://argoproj.github.io/argo-cd/)

<!-- install -->
+ [argo cli install](https://argoproj.github.io/argo-cd/cli_installation/)

<!-- details -->
+ [Resource Hoooks](https://argo-cd.readthedocs.io/en/stable/user-guide/resource_hooks/)
+ [Sync Options](https://argo-cd.readthedocs.io/en/stable/user-guide/sync-options/)
+ [RBAC Configuration](https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/)