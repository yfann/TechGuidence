

## dnsutils

+ `docker run -it gcr.io/kubernetes-e2e-test-images/dnsutils:1.3 /bin/sh`
    + end2end testing for kubernetes
    + `ping xxx`
    + `wget xxx`

+ `kubectl exec app-9cc7d9df8-ffsm6 ip a`
    + `docker exec -it kind-worker2 ip a`

+ `docker exec -it kind-worker2 /usr/sbin/ip netns list`
    + ` docker exec -it kind-worker2 /usr/sbin/ip netns pid`

+ `docker exec -it kind-worker2 iptables -L`


<!-- headless service test -->
+ `kubectl scale deployment app --replicas 4`
+ `kubectl get pods -l app=app -o wide`
+ `kubectl apply -f service-headless.yml`
+ `kubectl exec dnsutils -- host -v -t a headless-service`
+ `kubectl describe endpoints headless-service`

<!-- external service -->

+ `kubectl exec -it dnsutils -- host -v -t a github.com`
    + return A record
+ `kubectl exec -it dnsutils -- host -v -t cname external-service`
    + return CNAME