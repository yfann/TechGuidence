

## 多行命令

```yaml
image: alpine/git
imagePullPolicy: IfNotPresent
command:
    - sh
    - -c
    - |
    #!/usr/bin/env bash -e
    URL=.....
    FOLDER=/var/lib/grafana/plugins/aliyun-cms-grafana
    if [ ! -d $FOLDER ]; then
        git clone --depth=1 $URL $FOLDER
    else
        cd $FOLDER
        git pull
    fi
```

## tips
+ `parent: ~ ` null
+ `e: !!sr 123` 强转类型
+ `e: 'sss as  sss'` 用空格或特殊字符的字符串加引号
    - `str: 'labor''s day'`单引号转义
## ref
+ [YAML技巧](https://whmzsu.github.io/helm-doc-zh-cn/chart_template_guide/yaml_techniques-zh_cn.html)
+ [YAML 语言教程](https://www.ruanyifeng.com/blog/2016/07/yaml.html)