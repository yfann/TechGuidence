
## tips

+ port
    - port: service 暴露出的port
    - targetPort: 对应的deployment的port
```yml
  ports:
  - port: {{ .Values.service.externalPort }}
    targetPort: {{ .Values.service.internalPort }}
```


## service type
+ CLusterIP(集群内访问)
+ LoadBalancer(暴露给集群外部)