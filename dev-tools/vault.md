
## config
```yaml
# config.hcl

server:
  ha: 
     enabled: true 
       replicas: 3

     config: | 
         ui = true

	storage "mysql"{
	   username = ""
	   password = ""
	   database = "vault" 
	   address = "xxxx:3306"
	   ha_enabled = "true"
}
```

## ref
+ [Vault HA Cluster with Integrated Storage](https://learn.hashicorp.com/tutorials/vault/raft-storage)
+ [High Availability Mode](https://www.vaultproject.io/docs/concepts/ha)
+ [Vault Configuration](https://www.vaultproject.io/docs/configuration)