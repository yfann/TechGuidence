<!-- Check to see if I can do everything in my current namespace ("*" means all) -->
+ `kubectl auth can-i '*' '*'` 

<!-- Check to see if I can create pods in any namespace -->
+ `kubectl auth can-i create pods --all-namespaces`

<!-- Check to see if I can list deployments in my current namespace -->
+ `kubectl auth can-i list deployments.extensions`