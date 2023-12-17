

## cmd
+ `helm install --dry-run --debug`

+ `helm template test ./helm  --debug` 只在本地熏染
```yaml
apiVersion: v2
# some: problem section
# {{ .Values.foo | quote }}
# 注释部分任然输出
```

+ `helm get manifest` 查看安装了什么
## ref

+ [Debugging Templates](https://helm.sh/docs/chart_template_guide/debugging/)