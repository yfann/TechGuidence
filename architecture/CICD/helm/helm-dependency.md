

## cmd

+ `helm dependency build <chart>` 基于Chart.lock重构charts/目录
    + `helm dependency update  ./keycloak`

+ `helm dependency list`

+ `helm dependency update <chart>`
    + 基于Chart.yaml内容升级charts/

+ `helm package <chart>`

## tips

+ charts/
    + 依赖存放位置

## ref

+ [helm dependency](https://helm.sh/zh/docs/helm/helm_dependency/)