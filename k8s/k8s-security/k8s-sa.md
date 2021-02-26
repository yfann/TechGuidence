

## cmd
+ `kubectl get sa vault-auth -o jsonpath="{.secrets[*]['name']}" -n vault` 

## ref
+ [Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)