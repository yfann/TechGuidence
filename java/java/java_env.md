
## tips

+ `System.getenv()` 所有环境变量
    - `System.getenv("Path")` 获取环境变量

+ yaml中配置环境变量`${COMPUTERNAME:default value}`
```yaml
# 默认空值
name: ${TEST:}
```

+ `@Value` 默认不能注入static变量
  - 依赖注入依赖set方法（对象方法）
  - class上需要有`@Component`等注解


## ref
+ [java 的 System.getenv() 和 System.getProperty()](https://blog.csdn.net/jijianshuai/article/details/78863032)
+ [spring @value 注入static 注入静态变量方法](https://blog.csdn.net/ZYC88888/article/details/87863038)