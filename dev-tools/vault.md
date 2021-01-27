# vault

## cmd

<!-- local -->
+ `vault server -dev`
  + http://127.0.0.1:8200/ui/vault/auth?with=token


## install
+ `helm repo add hashicorp https://helm.releases.hashicorp.com`
+ `helm install vault hashicorp/vault  -f vault-config.yaml`

## config
+ mysql
```yaml
# vault-config.yaml

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

## issues

+ vault operator init-------> dial tcp 127.0.0.1:8200: connect: connection refused
  + 一般为storage的数据库连接问题
    
+ storage "postgresql"--------->2021-01-26T09:32:22.251Z [WARN]  storage migration check error: error="pq: relation "vault_kv_store" does not exist"
  + postgresql不会自动创建表, 需要在数据库中先创建vault_kv_store,vault_ha_locks表

## ref
+ [storage](https://www.vaultproject.io/docs/configuration/storage)
+ [Vault HA Cluster with Integrated Storage](https://learn.hashicorp.com/tutorials/vault/raft-storage)
+ [High Availability Mode](https://www.vaultproject.io/docs/concepts/ha)


<!-- config -->
+ [Vault Configuration](https://www.vaultproject.io/docs/configuration)
+ [Vault on Kubernetes Deployment Guide](https://learn.hashicorp.com/tutorials/vault/kubernetes-raft-deployment-guide?in=vault/kubernetes)
<!-- service broker -->
+ [hashicorp/vault-service-broker](https://github.com/hashicorp/vault-service-broker)

<!-- issues -->
+ [dial tcp 127.0.0.1:8200: connect: connection refused](https://discuss.hashicorp.com/t/vault-failed-to-start/2529)