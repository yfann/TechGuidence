

## cloud tools

+ Terraform(AWS CloudFormation)
    + IaC(Infrastructure as Code)
    + auto-provision infrastructure in minutes

+ Vagrant(docker)
    + EaC(Environments as Code)
    + build and deploy VM environments in minutes
    + 做到开发与线上环境一致，本地开发用VM装CentOS以及各种依赖包，Vagrant用于管理此VM

+ Ansible(puppet,CHEF)
    + Configuration as Code
    + scale app depoyment and configuration management
    + 配置管理工具

+ Airflow
    + Data Pipelines as Code
    + ETL

+ checkov
    + Security Configuration as Code
    + static code analysis tool for infrastructure-as-code.

+ Vault(AWS KMS)
    + Encryption Management as Code

+ Consul
    + 服务发现
    + 配置管理
    + 健康检查
    + 多中心

+ Nomad
    + 轻量级的K8s

+ Packer
    + 自动化打包镜像,单一模板创建多个平台的镜像（AWS,Azure,Alicloud）



## CI/CD
+ ArgoCD
+ github action
+ tekton


## log
+ Fluentd
    + log router
+ filebeat/fluentbit
    + 日志采集
+ Splunk/Hadoop/Hive
    + 日志分析




## ref


+ [The beginning of ‘Everything as Code’](https://medium.com/swlh/the-beginning-of-everything-as-code-a25c4e9a75e9)
+ [基于consul实现微服务的服务发现和负载均衡](https://tonybai.com/2018/09/10/setup-service-discovery-and-load-balance-based-on-consul/)