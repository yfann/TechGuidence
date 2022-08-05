
<!-- get -->
+ `kubectl get pods <pod-name> -o custom-columns=NAME:.metadata.name,RSRC:.metadata.resourceVersion`
+ `kubectl get service, pod, deployment -n <namespace>`

<!-- api-resources -->
+ `kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n <namespace>`


## ref
+ [How to List all Resources in a Kubernetes Namespace](https://www.studytonight.com/post/how-to-list-all-resources-in-a-kubernetes-namespace)