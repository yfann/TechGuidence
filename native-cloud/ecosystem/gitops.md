# GitOps
+ 更改 Git 仓库中的代码和配置来自动部署应用
+ GitOps is used to automate the process of provisioning infrastructure.
    + operations teams that adopt GitOps use configuration files stored as code (infrastructure as code).
    + GitOps configuration files generate the same infrastructure environment every time it’s deployed
+ GitOps provides Continuous Deployment for Kubernetes

## key components to gitops workflow
+ a Git repo
+ a CD pipeline
+ an application deployment tool
+ a monitoring system

## tools
+ argoCD
+ FluxCD


## tips

+ DevOps **GitOps** = IaC + MRs + CI/CD
    + IaC(Infrastructure as Code)
        + stored in git repo
    + MRs(Merge requests)
        + for all infrastructure updates
    + CI/CD
        + 

## ref
+ [What is GitOps](https://www.weave.works/blog/what-is-gitops-really)
+ [What is GitOps? ](https://about.gitlab.com/topics/gitops/)