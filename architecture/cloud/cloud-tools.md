

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

+ Knative
    + serverless架构方案
        + serverless应用的构建，部署，运行

+ k3s
    + 物联网,边缘计算(Edge)
        + ARM

+ k9s   
    + k9s 是一个基于 curses 的全屏终端 UI 管理工具，可以与 Kubernetes 集群进行交互，可以观察系统资源，在各种资源之间切换，检查清单、日志、监控事件并执行 Pod 等，从而确保桌面空间不至于被大量终端窗格所占据


## CI/CD
+ ArgoCD
+ github action
+ tekton
+ adnanh/webhook


## log
+ Fluentd
    + log router

+ filebeat
    + 通过host volume访问node特定目录的log,根据匹配规则筛选出特定container的log

+ fluentbit
    + 日志采集
+ Splunk/Hadoop/Hive
    + 日志分析
+ cloudevents


## RPC
+ Netty
+ Finagle

## k8s
+ kind

## IaaS

+ OpenStack


## PaaS

+ OpenShift

## ref
+ [The beginning of ‘Everything as Code’](https://medium.com/swlh/the-beginning-of-everything-as-code-a25c4e9a75e9)
+ [基于consul实现微服务的服务发现和负载均衡](https://tonybai.com/2018/09/10/setup-service-discovery-and-load-balance-based-on-consul/)

<!-- cloud native -->
+ [Awesome Cloud Native](https://jimmysong.io/awesome-cloud-native/)

<!-- tools -->
+ [adnanh/webhook](https://github.com/adnanh/webhook)
    + http endpoint -> configed command
+ [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
+ [cloudevents](https://github.com/cloudevents/spec)
+ [k3s vs k8s vs k9s](https://juejin.cn/post/6955368911705473060)
+ [rancher](https://rancher.com/docs/rancher/latest/zh/)