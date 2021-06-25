
## yaml中读取环境变量

```yml

# OSS_ENDPOINT是环境变量

oss:
  endpoint: ${OSS_ENDPOINT:}

```

```java
@Configuration
public class OssConfiguration {
    @Value("${oss.endpoint}")
    public  String endpoint;
....
```