
## env
<!-- 配置 -->
+ yaml中配置环境变量`${COMPUTERNAME:default value}`
```yaml
# 默认空值
name: ${TEST:}
```
<!-- 读取 -->
+ `System.getenv()` 所有环境变量
    - `System.getenv("Path")` 获取环境变量


## VCAP_SERVICES
+ spring 会把VCAP_APPLICATION and VCAP_SERVICES 解析成properties，可用Environment访问
  + CloudFoundryVcapEnvironmentPostProcessor解析
  + vcap.services.{name}.credentials...

+ local properties 加入到解析的结果中
```yaml
vcap:
  services:
    cat_picture_service:
      credentials:
        username: ZeroCool
        password: HackThePlanet!

# export VCAP_SERVICES_CAT_PICTURE_SERVICE_CREDENTIALS_USERNAME='ZeroCool'
# export VCAP_SERVICES_CAT_PICTURE_SERVICE_CREDENTIALS_PASSWORD='HackThePlanet!'
```

## tips

+ `@Value` 默认不能注入static变量
  - 依赖注入依赖set方法（对象方法）
  - class上需要有`@Component`等注解



## ref
+ [java 的 System.getenv() 和 System.getProperty()](https://blog.csdn.net/jijianshuai/article/details/78863032)
+ [spring @value 注入static 注入静态变量方法](https://blog.csdn.net/ZYC88888/article/details/87863038)
<!-- vcap_services -->
+ [Injecting Credentials Into Spring Boot Apps – The Easy Way](https://engineering.pivotal.io/post/spring-boot-injecting-credentials/)
+ [CloudFoundryVcapEnvironmentPostProcessor](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/cloud/CloudFoundryVcapEnvironmentPostProcessor.html)