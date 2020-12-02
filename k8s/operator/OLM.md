# Operator Lifecycle Manager (OLM) 

+ ClusterServiceVersion (CSV)
    + contains information on how to install the Operator and any dependencies it requires
    + if the Operator deployment is deleted, the CSV will recreate it to bring the cluster back to the desired state, similar to how a deployment will cause deleted pods to be recreated.

+ Subscription
    + create an InstallPlan
    + approval mode

+ OperatorGroup
    + To scope an Operator to a single namespace
    + To allow an Operator to run globally across all namespaces

## cmd
+ `kubectl -n olm get packagemanifests` get a list of operators