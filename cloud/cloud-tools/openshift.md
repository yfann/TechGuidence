
# openshift

+ OKD openShift(OpenShift的开源版本)
    + OpenShift Origin

## oc
+ `oc login <url>`
    + go to default project
    + `oc logout`
+ `oc config view`

<!-- projects -->
+ `oc new-project <project_name>` 创建
+ `oc delete project <name>`

+ `oc get projects`
+ `oc project` 查看当前
+ `oc project <name>` 切换


+ `oc status`

<!-- RBAC -->
+ `oc policy add-role-to-user <role_name> -z <serviceaccount_name>`
+ `oc policy add-cluster-role-to-user <role_name> -z <serviceaccount_name>`

## ref
+ [OpenShift/OpenShift Origin](https://www.openshift.com/)
+ [Openshift](https://cloud.tencent.com/developer/article/1649734)
+ [Get Started with the CLI](https://docs.openshift.com/enterprise/3.0/cli_reference/get_started_cli.html)


+ [Projects](https://docs.openshift.com/enterprise/3.0/dev_guide/projects.html)