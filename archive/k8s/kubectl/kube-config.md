

+ `kubectl config view`

<!-- kubeconfig添加user -->
+ `kubectl config set-credentials myuser --client-key=myuser.key --client-certificate=myuser.crt --embed-certs=true`

<!-- context -->
+ `kubectl config set-context myuser --cluster=kubernetes --user=myuser`
+ `kubectl config use-context myuser`