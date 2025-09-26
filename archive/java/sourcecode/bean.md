
## Bean的容器
+ BeanFactory
    + XMLBeanFactory
    + lazyload
        + 调用getBean()时才返回bean
```java
package com.zoltanraffai;  
import org.springframework.core.io.ClassPathResource;  
import org.springframework.beans.factory.InitializingBean; 
import org.springframework.beans.factory.xml.XmlBeanFactory; 
public class HelloWorldApp{ 
   public static void main(String[] args) { 
      XmlBeanFactory factory = new XmlBeanFactory (new ClassPathResource("beans.xml")); 
      HelloWorld obj = (HelloWorld) factory.getBean("helloWorld");    
      obj.getMessage();    
   }
}
```

+ ApplicationContext(org.springframework.context.ApplicationContext)
    + IOC容器，负责实例化，配置和组装bean
    + 读取配置的元数据(XML,annotation)实例化bean    
    + 继承BeanFactory
    + 预加载
```java

package com.zoltanraffai;  
import org.springframework.core.io.ClassPathResource;  
import org.springframework.beans.factory.InitializingBean; 
import org.springframework.beans.factory.xml.XmlBeanFactory; 
public class HelloWorldApp{ 
   public static void main(String[] args) { 
      ApplicationContext context=new ClassPathXmlApplicationContext("beans.xml"); 
      HelloWorld obj = (HelloWorld) context.getBean("helloWorld");    
      obj.getMessage();    
   }
}
```

## 容器内实例化bean的方式
+ InitializingBean
   + afterPropertiesSet()完成实例化工作
   + 一般框架层面才会用到
```java
public interface InitializingBean {
    void afterPropertiesSet() throws Exception;
}
```

+ PostConstruct(推荐)
```java
@PostConstruct
public void init() {
  System.out.println("Inside init() method...");
}
```


+ init-method
```java
public class MyClass {
   public void init() {
      // perform post-creation logic here
   }
}

@Configuration
public class AppConfig {
   @Bean(initMethod = "init")
   public MyClass myclass() {
      return new MyClass ();
   }
}

// <bean id="myClass" class="com.demo.MyClass" init-method="init"/>
```

+ BeanPostProcessor （切面方法）
```java
public interface BeanPostProcessor {
    Object postProcessBeforeInitialization(Object var1, String var2) throws BeansException;

    Object postProcessAfterInitialization(Object var1, String var2) throws BeansException;
}
```

+ 调用顺序
   1. BeanPostProcessor.postProcessBeforeInitialization()
   2. @PostConstruct
   3. InitializingBean.afterPropertiesSet()
   4. init-method
   5. BeanPostProcessor.postProcessAfterInitialization()

## ref

 [Spring Bean 生命周期之“我从哪里来”？懂得这个很重要](https://mp.weixin.qq.com/s/I7zgbOoCgAUnRFy4avipiQ)