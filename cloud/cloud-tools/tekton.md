# Tekton

+ 云原生CI/CD
    + 单元测试，构建镜像，推送到Docker Hub
    + github ---> k8s cluster

+ Pipelines -> Tasks(pod) -> steps(operation,container image)

## cmd
+ `tkn help`
+ `kubectl apply -f task.yaml`
+ `tkn task start <name> `
    + `tkn task start <name> --dry-run > <file>.yaml`


<!-- debug -->
+ `tkn taskrun logs`
+ `tkn taskrun logs --last -f`
+ `kubectl get events --sort-by=.metadata.creationTimestamp`

## ref

+ [tekton](https://tekton.dev/docs/getting-started/)
<!-- details -->
+ [Expose Pod Information to Containers Through Files](https://kubernetes.io/docs/tasks/inject-data-application/downward-api-volume-expose-pod-information/#the-downward-api)

<!-- task -->
+ [tekton hub](https://hub.tekton.dev/)
+ [generate-build-id](https://github.com/tektoncd/catalog/blob/main/task/generate-build-id/0.1/generate-build-id.yaml)
+ [kubernetes actions](https://hub.tekton.dev/tekton/task/kubernetes-actions)

+ git-clone