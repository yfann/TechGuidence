
+ 参数引用环境变量
```yaml
spec:
      containers:
      - args:
        - rule
        - --log.level=info
        - --log.format=logfmt
        - --grpc-address=0.0.0.0:10901
        - --http-address=0.0.0.0:10902
        - --objstore.config=$(OBJSTORE_CONFIG)
        ...
        env:
            - name: NAME
            valueFrom:
                fieldRef:
                fieldPath: metadata.name
            - name: OBJSTORE_CONFIG
            valueFrom:
                secretKeyRef:
                key: thanos.yaml
                name: thanos-objectstorage
```