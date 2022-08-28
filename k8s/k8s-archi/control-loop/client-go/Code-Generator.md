## Code generator

+ Why need code generator? client-go requires that `runtime.Object` types (CustomResources in golang have to implement the runtime.Object interface) must have DeepCopy methods

+ `// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object` 兼容k8s 1.8

+ top-level types
    + run as runtime.Object
    + metav1.TypeMeta embedded
    + client-gen create


## generate under go mod
+ `env GOPATH=xxx`
+ create hack folder under project
    + create `update-codegen.sh`
+ go.mod中添加`k8s.io/code-generator`
+ `go mod vendor`
    + project中会生成vendor目录存放第三方库
+ mac
    + `chmod -R 777 vendor`为vendor中的code-generator赋权限
    + `cd hack && ./update-codegen.sh`
        + `chmod +x update-codegen.sh`
        + `sudo -E ./update-codegen.sh`  sudo环境变量与默认不同,`-E`保存当前环境变量(GOPATH) 


## update-codegen.sh
```sh
bash ../vendor/k8s.io/code-generator/generate-groups.sh "deepcopy,client,informer,lister" \
  hsc-vcap-services-converter/pkg/generated hsc-vcap-services-converter/pkg/apis \
  hsc:v1 \
  --output-base $(pwd)/../../ \
  --go-header-file $(pwd)/boilerplate.go.txt
```
+ all  所有模块（clientset,informers,listers）
+ generated 生成代码的目录
+ apis 源目录
+ group:version




## ref
+ [*****Kubernetes Deep Dive: Code Generation for CustomResources](https://www.openshift.com/blog/kubernetes-deep-dive-code-generation-customresources)
+ [Generation and release cycle of clientset](https://blog.csdn.net/boling_cavalry/article/details/88924194)
+ [code-generator使用](https://tangxusc.github.io/2019/05/code-generator%E4%BD%BF%E7%94%A8/)

+ [使用code-generator创建crd controller](https://cloud.tencent.com/developer/article/1659440)
+ [kubernetes code-generator 用法：生成 kubernetes-style 的 api 和 client 代码](https://www.lijiaocn.com/%E9%A1%B9%E7%9B%AE/2019/04/04/k8s-code-generator-usage.html)
+ [code-generator使用](https://tangxusc.github.io/blog/2019/05/code-generator%E4%BD%BF%E7%94%A8/)

+ [Generation and release cycle of clientset](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/generating-clientset.md)

<!-- code -->
+ [kubernetes/code-generator](https://github.com/kubernetes/code-generator)
+ [kubernetes/gengo](https://github.com/kubernetes/gengo)
<!-- sample -->
+ [openshift-evangelists/crd-code-generation](https://github.com/openshift-evangelists/crd-code-generation)
<!-- TLDR -->
+ [API Conventions](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md)


<!-- issues -->
+ [widnows unknown escape sequence](https://github.com/kubernetes/sample-controller/issues/40)