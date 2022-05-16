



## tips
+ values.yaml或--set 提供的值通过`.Values`访问
+ 在循环中`.`的作用域会改变
    - `{{- $relname := .Release.Name -}}`
+ `required` 为空时显示错误信息
    - `value: {{ required "A valid .Values.who entry required!" .Values.who }}`
+ `include`一个templdate中引入另一个template
    - `value: {{ include "mytpl" . | lower | quote }}`

+ `range`
```go
{{- range .Values.serviceBinding.instances -}}
{{ . }}
{{ end }}

{{- range $key, $val := .envMapping }}
...
```

+ `value-*.yaml` 会覆盖 `values.yaml`内容



+ `{{ toYaml .Values.affinity | indent 8 }}`
    + string to yaml


## ref
+ [Variables](https://helm.sh/docs/chart_template_guide/variables/#helm)
+ [Named Templates](https://helm.sh/docs/chart_template_guide/named_templates/)

+ [go package template](https://godoc.org/text/template)