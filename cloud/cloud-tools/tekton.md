# Tekton

+ 云原生CI/CD
    + 单元测试，构建镜像，推送到Docker Hub
    + github ---> k8s cluster

+ Pipelines -> Tasks(pod) -> steps(operation,container image)

## cmd

+ `tkn task start <name> `
    + `tkn task start <name> --dry-run > <file>.yaml`
<!-- log -->
+ `tkn taskrun logs --last -f`

## ref

+ [tekton](https://tekton.dev/docs/getting-started/)
<!-- details -->
+ [kubernetes actions](https://hub.tekton.dev/tekton/task/kubernetes-actions)
+ [Expose Pod Information to Containers Through Files](https://kubernetes.io/docs/tasks/inject-data-application/downward-api-volume-expose-pod-information/#the-downward-api)