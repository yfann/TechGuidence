## cli

+ `mvn spring-boot:run`

+ `java -jar -Dspring.config.location=**.properties <JARFILE> --server.port=8080`

+ `java -jar  <JARFILE> --spring.profiles.active=dev`

+ `java -jar -Dspring.profiles.active=prod <*.jar>`

```java
//java -Dxxx.abc="123"
//-D jvm参数
//可以被System.getProperties()获取

public static void main(String args[]) {
    System.out.println(System.getProperty("fuck.abc"));
}

```

+ `java –jar demo.jar --debug` application.properties中debug = true

+ `jar cvf test.jar * ` jar解压出的文件重新打成jar包