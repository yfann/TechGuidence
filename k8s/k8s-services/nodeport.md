## tips
+ 每个node都会开端口
+ --service-node-port-range (default: 30000-32767) 指定node的端口
    + 随机在范围中选择
    + service中记录.spec.ports[*].nodePort

+ --nodeport-addresses
    + kube-proxy中设置，指定ip范围(10.0.0.0/8, 192.0.2.0/25)

+ nodePort(指定nodeport)
    + 都可访问：    
        + <NodeIP>:spec.ports[*].nodePort
        + .spec.clusterIP:spec.ports[*].port
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: MyApp
  ports:
      # By default and for convenience, the `targetPort` is set to the same value as the `port` field.
    - port: 80
      targetPort: 80
      # Optional field
      # By default and for convenience, the Kubernetes control plane will allocate a port from a range (default: 30000-32767)
      nodePort: 30007
```


## cmd
+ `kubectl expose deployment nginx --type="NodePort" --port=80`
<!-- export NodePort=$(kubectl get svc/nginx -o go-template='{{(index .spec.ports 0).nodePort}}') -->
  + `curl <公网ip>:<NodePort>`
    + 集群ip一般为内网ip