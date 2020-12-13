## events
+ a number of independent control loops communicate purely through object changes on the API server and events these changes trigger through informers


+ Watch events 
    + are sent through streaming HTTP connections(Watches) between the API server and controllers to drive informers.
    + invisible to the user
    + only the object updates are visible

+ The top-level Event object 
    + is a resource like pods, deployments, or services, with the special property that it has a time-to-live of an hour and then is purged automatically from etcd.
    + user-visible logging mechanism
    + `kubectl -n kube-system get events`


## ref
+ [Events, the DNA of Kubernetes [Updated]](https://www.mgasch.com/post/k8sevents/)