
## install
+ `choco install terraform`
    + `terraform version`


## cmd

+ `terraform init`
    + 代码路径下执行(包含tf文件的目录)
    + `terraform init -backend-config=backend.hcl`
        + 传递backend配置文件

+ `terraform plan`
    + 查看变更

+ `terraform apply`

+ `terraform destroy`

+ `terraform force-unlock` 解除状态锁

<!-- workspace -->
+ `terraform workspace new <name>`
+ `terraform workspace select <name>`
    + `terraform workspace show`
+ `terraform workspace delete <name>`
+ `terraform workspace list`

## provider插件
+ `terraform init`下载相关Provider插件到.terraform文件夹
+ 插件缓存
    + `export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"`


## tfstate

+ terraform.tfstate状态管理
    + 状态文件丢失会导致重复创建资源或无法destroy资源

+ Terraform Remote Backend
    + tfstate文件的存储和共享
    + 支持的存储服务
        + consul,s3,etcd
    + 支持状态锁
        + 同一时间只能执行一个变更

## ref

+ [terraform doc](https://www.terraform.io/docs/index.html)
+ [terraform入门教程](https://lonegunmanb.github.io/introduction-terraform/)
<!-- details -->
+ [hashicorp/go-plugin](https://github.com/hashicorp/go-plugin)
+ [Providers](https://www.terraform.io/docs/language/providers/index.html)
    + https://registry.terraform.io/browse/providers

<!-- others -->
+ [玩转阿里云 Terraform(一)：Terraform 是什么](https://zhuanlan.zhihu.com/p/87364149)
+ [什么是Terraform](https://www.alibabacloud.com/help/zh/doc-detail/91285.htm)
+ [Terraform语法入门](https://cloud.tencent.com/developer/article/1600047)
+ [terraform-provider-tencentcloud/examples/](https://github.com/hashicorp/terraform-provider-tencentcloud/tree/master/examples)
+ [Terraform 使用实例详解](https://www.linuxidc.com/Linux/2018-01/150452.htm)