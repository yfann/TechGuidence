
## cmd

+ `kubectl create role pod-reader --verb=get --verb=list --verb=watch --resource=pods`
    + `kubectl create role pod-reader --verb=get --resource=pods --resource-name=readablepod --resource-name=anotherpod`
    + `kubectl create role foo --verb=get,list,watch --resource=replicasets.apps` 指定apiGroups

+ `kubectl create rolebinding bob-admin-binding --clusterrole=admin --user=bob --namespace=acme`
    + `kubectl create rolebinding myappnamespace-myapp-view-binding --clusterrole=view --serviceaccount=myappnamespace:myapp --namespace=acme`