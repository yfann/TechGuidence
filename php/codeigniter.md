## 配置php on tomcat

+ [安装vc6/vc9](http://php.net/manual/zh/install.windows.requirements.php)
+ [下载php压缩包](http://windows.php.net/download/)
+ 解压到tomcat更目录下并配置环境变量
+ php目录下 php.ini-development 改名 php.ini
+ php.ini中添加extension_dir = "ext" 
+ php.ini中添加cgi.force_redirect = 0
+ tomcat目录中修改tomcat/conf/context.xml
```xml
<Context privileged="true">
 ...
</COntext>
```
+ tomcat webapps\root\web-inf\web.xml (<web-app>下)中添加
```
<servlet>  
    <servlet-name>php</servlet-name>  
    <servlet-class>org.apache.catalina.servlets.CGIServlet</servlet-class>  
    <init-param>  
      <param-name>clientInputTimeout</param-name>  
      <param-value>200</param-value>  
    </init-param>  
    <init-param>  
      <param-name>debug</param-name>  
      <param-value>0</param-value>  
    </init-param>  
    <init-param>  
      <param-name>executable</param-name>  
      <param-value>D:\Program Files\apache-tomcat-8.5.20\php\php-cgi.exe</param-value>  
    </init-param>  
    <init-param>  
        <param-name>passShellEnvironment</param-name>  
    <param-value>true</param-value>  
    </init-param>  
      <init-param>  
        <param-name>cgiPathPrefix</param-name>  
        <param-value>WEB-INF/php</param-value>  
      </init-param>  
        <load-on-startup>5</load-on-startup>  
    </servlet> 

<servlet-mapping>  
    <servlet-name>php</servlet-name>  
    <url-pattern>/php/*</url-pattern>  
</servlet-mapping>  
```

+ tomcat webapps\root\web-inf\php\index.php(web-inf下新建php目录)

```php
<?php
    phpinfo();
?>
```

+ test http://localhost:8080/php/index.php


## ref
+ [php w3shool](http://www.w3school.com.cn/php/php_intro.asp)
+ [php install](http://php.net/manual/zh/install.php)
+ [Manual PHP Installation on Windows]http://php.net/manual/zh/install.windows.legacy.index.php#install.windows.legacy.iis7)
+ [php on tomcat](http://www.cnblogs.com/qingmaple/p/6032857.html)
+ [codeigniter 安装](http://codeigniter.org.cn/user_guide/installation/index.html)