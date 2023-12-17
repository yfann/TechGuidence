

+ alpine



## networking Docker image

+ gcr .io/kubernetes-e2e-test-images/dnsutils:1.3 
    + `kubectl exec dnsutils -- host postgres-0.postgres.default.svc.cluster.local.`
    + `kubectl exec -it dnsutils -- wget -q -O-  172.18.0.5:30040/host`

+ nicolaka/netshoot
    + `docker run --network kind -a stdin -a stdout -i -t nicolaka/netshoot`
        +  attach Docker container to the KIND network
        + `curl 172.18.255.200/host`