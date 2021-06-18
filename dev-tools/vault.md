# vault

## cmd

<!-- local -->
+ `vault server -dev`
  + http://127.0.0.1:8200/ui/vault/auth?with=token

<!-- unseal -->
+ `kubectl exec -it vault-0 -- /bin/sh`
    + `vault operator init`
    + `export VAULT_TOKEN=<root token>`
    + `vault operator unseal <unseal key>`

+ `vault status`

<!-- secret -->
+ `vault secrets list`
+ `vault kv put <path> <key>=<val> <key1>=<val1>`
+ `vault kb get <path>`
  + `vault kv get kv/database/config`


<!-- policy -->
+ `vault policy write <name>`
```conf
vault policy write internal-app - <<EOF
path "internal/data/database/config" {
  capabilities = ["read"]
}
EOF
```
+ `vault policy list`
+ `vault policy read <name>`

<!-- auth -->
+ `vault auth list`
<!-- auth k8s -->
+ `vault auth enable kubernetes`
  + `vault auth disable kubernetes`
+ `vault list auth/kubernetes/role`
+ `vault write auth/kubernetes/login role=<role name> jwt=<token>`
+ `vault read auth/kubernetes/config`
```conf
vault write auth/kubernetes/config \
    token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
```
+ `vault read auth/kubernetes/role/<role name>`
```conf
vault write auth/kubernetes/role/vault \
    bound_service_account_names=vault \
    bound_service_account_namespaces=vault \
    policies=test \
    ttl=24h
```


<!-- token -->
+ `vault token capabilities <path>` 查看当前token对path的权限
+ `vault token create -policy=<policy name> -policy=<policy name1>`



## install
+ `helm repo add hashicorp https://helm.releases.hashicorp.com`
+ `helm install vault hashicorp/vault  -f vault-config.yaml`

## config

+ `helm pull hashicorp/vault`  vaule.yaml for details

+ mysql
```yaml
# vault-config.yaml

global:
  enabled: true

server:
  ha:
    enabled: true
    replicas: 3
# Stateful deployment时的默认配置。HCL格式,会保存到ConfigMaps中
    config: |
      ui = true
      
      listener "tcp"{
        tls_disable = 1
        address = "[::]:8200"
        cluster_address = "[::]:8201"
        # tls_cert_file = "/path/to/fullchain.pem"
        # tls_key_file  = "/path/to/privkey.pem"
      }

      storage "mysql"{
        username = "xxxx"
        password = "xxxx"
        database = "vault" 
        address = "xxxxx:3306"
        ha_enabled = "true"
      }
```

+ postgresql
```yaml

global:
  enabled: true

server:
  ha:
    enabled: true
    replicas: 3
  
    config: |
      ui = true
      
      listener "tcp"{
        tls_disable = 1
        address = "[::]:8200"
        cluster_address = "[::]:8201"
      }

      storage "postgresql"{
        connection_url = "postgres://<user name>:<pwd>@<postgresql host url>:<port>/<dbname>?sslmode=disable"
        ha_enabled = "true"
        table = "vault_kv_store"
        ha_table = "vault_ha_locks"
      }
```

## auto unseal
+ config
```hcl
seal "alicloudkms" {
        region     = "cn-shanghai"
        access_key = ""
        secret_key = ""
        kms_key_id = ""
      }
```

+ `vault operator init`  执行后会自动unseal



## vault agent
+ work as init container
  + exit_after_auth = true 
+ work as sidecar
  + exit_after_auth = fase
+ VAULT_ADDR
  + 环境变量，vault server的地址

+ vault-agent配置
```yaml
initContainers:
- args:
  - agent
  - -config=/etc/vault/vault-agent-config.hcl
  - -log-level=debug
  env:
  - name: VAULT_ADDR
    value: http://192.168.64.1:8200
  image: vault
  name: vault-agent
  volumeMounts:
  - mountPath: /etc/vault
    name: config
  - mountPath: /etc/secrets
    name: shared-data
```
+ Vault Agent Configuration Map
  + annotation `vault.hashicorp.com/agent-configmap:<configmap name>`
  + mount to `/vault/configs`
  + `config-init.hcl` used by the init container. This must have `exit_after_auth` set to `true`.
  + `config.hcl` used by the sidecar container. This must have `exit_after_auth` set to `false`.



## tips

+ mod
  + standalone (StatefulSet. Integrated Storage or a Consul storage backend)
  + HA
  + Dev

+ vault agent, template 导出环境变量
```yaml
  vault.hashicorp.com/agent-inject-template-config: |
    {{ with secret "secret/data/web" -}}
      export api_key="{{ .Data.data.payments_api_key }}"
    {{- end }}
  ....
  args:
    ['sh', '-c', 'source /vault/secrets/config && <entrypoint script>']
  # kubectl exec -it <pod name> -- sh 进去看不到env 是因为开启了新的shell
```

+ vault.hashicorp.com/agent-configmap
  + mount to /vault/configs

## issues

+ vault operator init-------> dial tcp 127.0.0.1:8200: connect: connection refused
  + 一般为storage的数据库连接问题
    
+ storage "postgresql"--------->2021-01-26T09:32:22.251Z [WARN]  storage migration check error: error="pq: relation "vault_kv_store" does not exist"
  + postgresql不会自动创建表, 需要在数据库中先创建vault_kv_store,vault_ha_locks表

+ openshift 安装vault,需要设置gid,uid
```yaml

injector:
  gid: 1000600000
  uid: 1000600000

server:
  gid: 1000600000
  uid: 1000600000
```

+ openshift 使用vault agent,app上需要加(使注入的ageng container使用openshift默认的security-context)
```yaml
vault.hashicorp.com/agent-set-security-context: "false"
```

## ref
+ [storage](https://www.vaultproject.io/docs/configuration/storage)
+ [Vault HA Cluster with Integrated Storage](https://learn.hashicorp.com/tutorials/vault/raft-storage)
+ [High Availability Mode](https://www.vaultproject.io/docs/concepts/ha)
+ [hashicorp/vault-guides](https://github.com/hashicorp/vault-guides)

<!-- detail -->
+ [Lease, Renew, and Revoke](https://www.vaultproject.io/docs/concepts/lease)
<!-- Vault Agent -->
+ [Vault Agent](https://www.vaultproject.io/docs/agent)
+ [Vault Agent with Kubernetes*************](https://learn.hashicorp.com/tutorials/vault/agent-kubernetes?in=vault/kubernetes)
+ [Agent Sidecar Injector](https://www.vaultproject.io/docs/platform/k8s/injector)
+ [Injecting Secrets into Kubernetes Pods via Vault Helm Sidecar](https://learn.hashicorp.com/tutorials/vault/kubernetes-sidecar)
+ [Kubernetes Mutation Webhook Controller](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
+ [Vault Agent Templates](https://www.vaultproject.io/docs/agent/template)
  + render secrets to file
  + renew secret
  + consul template markup
+ [Kubernetes Auth Method](https://www.vaultproject.io/docs/auth/kubernetes)
+ [Agent Annotations](https://www.vaultproject.io/docs/platform/k8s/injector/annotations)
<!-- Vault Agent demo -->
+ [Vault Agent Injector Examples](https://www.vaultproject.io/docs/platform/k8s/injector/examples)
+ [vault agent k8s demo](https://github.com/hashicorp/vault-guides/tree/master/identity/vault-agent-k8s-demo)
+ [read mount file](https://github.com/jsgilmore/mount/blob/master/mounts_linux.go)



<!-- unseal -->
+ [Auto-unseal using AWS KMS](https://learn.hashicorp.com/tutorials/vault/autounseal-aws-kms?in=vault/auto-unseal)

<!-- config -->
+ [Vault Configuration](https://www.vaultproject.io/docs/configuration)
+ [Vault on Kubernetes Deployment Guide](https://learn.hashicorp.com/tutorials/vault/kubernetes-raft-deployment-guide?in=vault/kubernetes)
+ [postgressql connection](https://pkg.go.dev/github.com/lib/pq#hdr-Connection_String_Parameters)

<!-- design -->
+ [Vault on Kubernetes Reference Architecture](https://learn.hashicorp.com/tutorials/vault/kubernetes-reference-architecture)

<!-- others -->
+ [hashicorp/vault-service-broker](https://github.com/hashicorp/vault-service-broker)
+ [DaspawnW/vault-crd](https://github.com/DaspawnW/vault-crd)


<!-- issues -->
+ [dial tcp 127.0.0.1:8200: connect: connection refused](https://discuss.hashicorp.com/t/vault-failed-to-start/2529)
+ [Vault-helm and kubernetes environment variables](https://discuss.hashicorp.com/t/vault-helm-and-kubernetes-environment-variables/4973)
+ [permission denied](https://github.com/coreos/vault-operator/issues/359)
  + cannot create resource \"tokenreviews\" in API group \"authentication.k8s.io\" at the cluster scope

<!-- postgresql backend -->
+ [PostgreSQL Storage Backend](https://www.vaultproject.io/docs/configuration/storage/postgresql)