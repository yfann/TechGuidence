
## cmd 
+ `kubectl create secret`
```bash
# 设置键名
kubectl create secret generic db-user-pass \
  --from-file=username=./username.txt \
  --from-file=password=./password.txt
```
+ `kubectl get secrets`
    - `kubectl get secret <secret name> -o yaml`
+ `kubectl describe secrets/db-user-pass`
+ `kubectl edit secrets <secret name>`

## Secret
+ 保存敏感信息
+ 使用
    - 挂载到容器上的卷中的文件
    - 作为容器的环境变量
    - kubelet 为Pod拉取镜像时使用
+ 服务账号使用 API 凭证自动创建和附加 Secret
+ Secret 对象的名称必须是合法的 DNS 子域名
+ 数据
    + data,存储base64编码的任意数据
        - `echo -n 'admin' | base64`
        - `echo 'MWYyZDFlMmU2N2Rm' | base64 --decode`
    + stringData,未编码的字符串
```yaml
# ......
data:
  config.yaml: YXBpVXJsOiAiaHR0c...
# ......
```
## ref
+ [Secret](https://kubernetes.io/zh/docs/concepts/configuration/secret/)
+ [对象名称和IDs](https://kubernetes.io/zh/docs/concepts/overview/working-with-objects/names/#dns-subdomain-names)