
# openshift

+ OKD openShift(OpenShift的开源版本)
    + OpenShift Origin

+ openshift run on RHEL CoreOS(master node)/RHEL(worker nodes)
    + OKD run on CentOS

## openshift vs rancher

+ openshift is a k8s distribution,downstream from the k8s open-source project
    + add features from k8s
        + jenkins pipeline

+ rancher is a tool for managing k8s cluster
    + Ranchers can easily manage multiple clusters.


## oc
<!-- install on mac -->
+ openshift portal -> Command Line Tools -> oc - OpenShift CLI
    + download oc
+ `echo $PATH`
+ move oc to PATH folder
+ `ctrl + click` open with iTerm


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
+ [10 most important differences between OpenShift and Kubernetes](https://blog.cloudowski.com/articles/10-differences-between-openshift-and-kubernetes/)
<!-- install -->
+ [Getting started with the CLI](https://docs.openshift.com/container-platform/4.2/cli_reference/openshift_cli/getting-started-cli.html)