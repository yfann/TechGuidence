## tips
+ Admission controllers act on requests that create, modify, delete, or connect to (proxy) an object. 
+ Admission controllers do not act on requests that merely read objects.
+ When multiple admission controllers are configured, they are called in order.
+ if any admission controller module rejects, then the request is immediately rejected.


## ref
+ [Using Admission Controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
+ [Dynamic Admission Control](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/)