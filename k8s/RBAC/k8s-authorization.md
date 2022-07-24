

## k8s authorization modules
+ Node
    + authorizes API requests made by kubelets.
+ ABAC
+ RBAC
+ webhook mode
    + causes Kubernetes to query an outside REST service when determining user privileges.

<!-- tips -->
+ used by API server
+ return 403 if all modules denied


## API request attributes
+ user
+ group
+ extra
    + map
+ API
    + Indicates whether the request is for an API resource.


## ref
+ [Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)
+ [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
+ [Using Node Authorization](https://kubernetes.io/docs/reference/access-authn-authz/node/)
+ [Webhook Mode](https://kubernetes.io/docs/reference/access-authn-authz/webhook/)