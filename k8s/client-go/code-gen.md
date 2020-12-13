## code geneartor

+  k8s.io/code-generator 

+ conversion-gen
    + between internal and external types.

+ defaulter-gen
    + Takes care of defaulting certain fields.

## deepcopy-gen
+ zz_generated..

## client-gen
+ create a typed client

+ `pkg/generated/clientset/versioned`

+ 

## informer-gen

## calling

+ common use
    + k8s.io/code-generator/generate-groups.sh
    + hack/update-codegen.sh

+ building a controller for CRs
```sh
# all
    # deepcopy-gen
    # client-gen
    # informer-gen
    # lister-gen
 vendor/k8s.io/code-generator/generate-groups.sh all \
#  The second parameter is the target package name for the generated clients, listers, and informers.
    github.com/programming-kubernetes/cnat/cnat-client-go/pkg/generated
    # The third parameter is the base package for the API group.
    github.com/programming-kubernetes/cnat/cnat-client-go/pkg/apis \
    # The fourth parameter is a space-separated list of API groups with their versions.
    cnat:v1alpha1 \
    # --output-base is passed as a flag to all generators to define the base directory where the given packages are found.
    --output-base "${GOPATH}/src" \
    # --go-header-file enables us to put copyright headers into generated code.
    --go-header-file "hack/boilerplate.go.txt"
```
   - all

+ sample-controller
    + `hack/update-codegen.sh`
    + `hack/verify-codegen.sh`
        + 会调用`hack/update-codegen.sh`
        + generated fiels是否有改动，改动这退出
        + CI会有用

## tags

+ controlle the generators

+ global tags
    + above the package line
    + doc.go
<!-- pkg/apis/group/version/doc.go -->
```go
// +k8s:deepcopy-gen=package

// Package v1 is the v1alpha1 version of the API.
// +groupName=cnat.programming-kubernetes.info
package v1alpha1
```
+ local tags
    + above a type declaration

+ API documentation( keep the tags out of the API documentation)
```go
// There are a number of tags that must be in a comment directly above a type (or the package line for a global tag), while others must be separated from the type (or the package line) with at least one empty line in between them. For example:


// +second-comment-block-tag

// +first-comment-block-tag
type Foo struct {
}
```

+ +groupName

+ +k8s:deepcopy-gen=package
    + +k8s:deepcopy-gen=true
    + +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
    + runtime.Objects
    +  API types must be deep-copyable

+ +genclient
    + It tells client-gen to create a client for this type
    + 不能放在list type上

+ +genclient:noStatus

+ +genclient:nonNamespaced
    + generate a client without namespace

## ref
+ [update-codegen.sh](https://github.com/programming-kubernetes/cnat/blob/master/cnat-client-go/hack/update-codegen.sh)
+ [kubernetes/sample-controller](https://github.com/kubernetes/sample-controller)

+ [deepcopy-gen](https://github.com/kubernetes/code-generator/blob/be3b346a66ceec9212f7b4e7ad1157f1562327a3/cmd/deepcopy-gen/main.go#L17)
+ [client-gen](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/generating-clientset.md
+ [informer-gen lister-gen](https://github.com/kubernetes/code-generator/blob/639c964206c28ac3859cf36f212c24775616884a/generate-groups.sh#L86)
<!-- sample -->
+ [doc.go](https://github.com/programming-kubernetes/cnat/blob/master/cnat-client-go/pkg/apis/cnat/v1alpha1/doc.go)
+ [cnat example](https://github.com/programming-kubernetes/cnat/blob/master/cnat-client-go/pkg/apis/cnat/v1alpha1/types.go)