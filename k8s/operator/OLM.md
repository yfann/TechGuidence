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

## enable OLM
+ `operator-sdk olm status`
    + `--olm-namespace=[non-default-olm-namespace]`
+ `operator-sdk olm install` install OLM
    + `operator-sdk olm uninstall`
    + `--version`

## bundle
+ `make bundle` create bundle
    + CSV in bundle/manifests
    + CRD in config/crds
    + bundle metadata in bundle/metadata
    + Dockerfile bundle.Dockerfile
    + `operator-sdk bundle validate` validate bundle
<!-- deploy bundle -->
+ `make bundle-build BUNDLE_IMG=<some-registry>/memcached-operator-bundle:<tag>`
+ `docker push <some-registry>/memcached-operator-bundle:<tag>`
    + `operator-sdk bundle validate <some-registry>/memcached-operator-bundle:<tag>`

## cmd
+ `kubectl -n olm get packagemanifests` get a list of operators


## tips
+ opm(Operator package manager tool)---<build>--->index images--<add>--->cluster catalog---<discovery>--->OLM

## ref
+ [operator-framework/operator-lifecycle-manager](https://github.com/operator-framework/operator-lifecycle-manager/)
+ [OLM Integration Bundle Quickstart](https://sdk.operatorframework.io/docs/olm-integration/quickstart-bundle/)
+ [Operator Bundle](https://github.com/operator-framework/operator-registry/blob/v1.12.6/docs/design/operator-bundle.md)