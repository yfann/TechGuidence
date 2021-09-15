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

## ClusterServiceVersion manifests
+ define all aspects of an Operator(operator's metadata)
+ 包括
    + CRDs
    + metadata describing the Operator's maintainers
+ semver
    + metadata.name
    + spec.version
+ CSV generator
    + generate <bundle|packagemanifests>

## cmd

+ `operator-sdk generate kustomize manifests`
    + generates a CSV kustomize base config/manifests/bases/<project-name>.clusterserviceversion.yaml and a config/manifests/bases/kustomization.yaml by default. 
        + prepare for `kustomize build`
    + parse CSV markers from Go API type(./api)
        + `--apis-dir` 指定API types root directory
+ `kubectl -n olm get packagemanifests` get a list of operators

## install OLM
+ `operator-sdk olm status` 查看是否存在
    + `--olm-namespace=[non-default-olm-namespace]`
+ `operator-sdk olm install` install OLM
    + `operator-sdk olm uninstall`
    + `--version`

## deploy to openshift

+ `make docker-build IMG=<remote-repo>/<operator-name>:<tag>`
    + `docker build -t <remote-repo>/<operator-name>:<tag> .`
+ `make docker-push IMG=<remote-repo>/<operator-name>:<tag>`
    + `docker push <remote-repo>/<bundle-name>:<tag>`
+ `make bundle IMG=<remote-repo>/<operator-name>:<tag>`
+ `make bundle-build BUNDLE_IMG=<remote-repo>/<bundle-name>:<tag>`
+ `docker push <remote-repo>/<bundle-name>:<tag>`
+ `oc login <openshift-url>`
+ `operator-sdk run  bundle <remote-repo>/<bundle-name>:<tag>`


## clean
+ `operator-sdk cleanup <operatorPKGname>`
    + bundle/metadata/annotations.yaml
        + bundle.package
+ `kubectl delete  catalogsources.operators.coreos.com <project name>-catalog`

## bundle format
+ An Operator Bundle is built as a scratch (non-runnable) container image that contains operator manifests and specific metadata in designated directories inside the image. Then, it can be pushed and pulled from an OCI-compliant container registry. Ultimately, an operator bundle will be used by Operator Registry and OLM to install an operator in OLM-enabled clusters.

+ `make bundle` create bundle
    + 会执行
        + `generate kustomize manifests`
            + creates kustomize bases and a kustomization.yaml in config/manifests
        + `generate bundle`
            + creates a new or updates an existing bundle in the <project-root>/bundle directory. This command generates both manifests and metadata.
        + `operator-sdk bundle validate` 
            + validates an Operator bundle image or unpacked manifests and metadata.
    + 包含
        + CSV in bundle/manifests
        + CRD in config/crds
        + bundle metadata in bundle/metadata
        + Dockerfile bundle.Dockerfile
<!-- deploy bundle -->
+ `make bundle-build BUNDLE_IMG=<some-registry>/memcached-operator-bundle:<tag>`
    + builds a bundle image using the bundle.Dockerfile generated by make bundle
+ `docker push <some-registry>/memcached-operator-bundle:<tag>`
    + `operator-sdk bundle validate <some-registry>/memcached-operator-bundle:<tag>`

## package manifests format
+ bundle's metadata
+ `make packagemanifests`
    + packagemanifests/0.0.1
        + CSV
        + CRD
        + package manifest YAML 
+ `operator-sdk generate packagemanifests`
    + creates a new or updates an existing versioned directory as part of the package manifests in the <project-root>/packagemanifests directory.
<!-- test -->
+ `operator-sdk run packagemanifests --version 0.0.1`
    + runs an Operator’s package manifests format with an existing OLM installation
    + create an Operator registry
        + from manifests and metadata
    + inform OLM operator is ready to be deployed
    + 模拟production deployment
        + success
            + ClusterServiceVersion installed
            + CustomResourceDefinition installed
+ `operator-sdk cleanup <operator name>`清理测试结果


## update operator(添加了新的API)
+ bundle format
    + `make bundle IMG=quay.io/<user>/memcached-operator:v0.0.1`

+ package manifests
    + `make packagemanifests FROM_VERSION=0.0.1 CHANNEL=beta IS_CHANNEL_DEFAULT=1 IMG=quay.io/<user>/memcached-operator:v0.0.2`



## tips
+ opm(Operator package manager tool)---<build>--->index images--<add>--->cluster catalog---<discovery>--->OLM

+ Makefile version

## ref
+ [OLM Integration Bundle Quickstart](https://sdk.operatorframework.io/docs/olm-integration/quickstart-bundle/)
+ [Operator Lifecycle Manager concepts](https://docs.openshift.com/container-platform/4.5/operators/understanding/olm/olm-understanding-olm.html)

+ [CSV marker](https://sdk.operatorframework.io/docs/building-operators/golang/references/markers/)

<!-- source -->
+ [operator-framework/operator-lifecycle-manager](https://github.com/operator-framework/operator-lifecycle-manager/)
+ [Operator Bundle](https://github.com/operator-framework/operator-registry/blob/v1.12.6/docs/design/operator-bundle.md)
+ [operator-registry](https://github.com/operator-framework/operator-registry)