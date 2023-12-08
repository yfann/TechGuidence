# openGauss command
+ `gs_om -t status --detail`
    + 验证安装
+ `gs_om -t stop`
    + `gs_om -t start`

+ `gsql -d postgres -p 15400` 登录数据库
    + `select version();`
    + `gsql -d postgres -p 15400 -U fan`

+ `\q` 退出

## ref
+ [gsql](https://docs-opengauss.osinfra.cn/zh/docs/5.0.0/docs/ToolandCommandReference/gsql.html)