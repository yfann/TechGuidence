# Java
+ final
    + final 变量,初始化后不能修改
        - 构造器中初始化
        - blank final variable
    + static binding,修饰方法,子类不能改写
    + final class,不能继承
## cli

+ `jar tvf *.jar` /*查看jar*/
+ `java -jar *.jar` /*运行可执行jar*/

## Tips

+ 一个java文件只允许一个public class,文件名要与public class相同(大小写敏感)
+ transient：只修饰属性，不会被序列化(Serializable)
+ static{} /*类加载时执行一次*/
+ `System.out::println` 等于`x -> System.out.println(x)`,是lambda的简写,叫eta-conversion/eta-expansion,'类名::方法名'

## tips ref

+ [类加载](https://www.cnblogs.com/caolaoshi/p/7824748.html)
+ [SpringBoot打jar包或war包获取不到资源文件解决办法](https://juejin.im/post/5be14d11f265da612d18bbf4)
>jar里读文件一般用stream去读，而不是路径(linux无法直接访问未解压的文件),通过`ClassLoader`的`getResourceAsStream()`方法获取流

>Class.getResource(String path)
>+ path以/开头：则是从ClassPath根下获取
>+ path不以/开头：默认是从此类所在的包下取资源

>ClassLoader.getResource(String path)
>+ path默认从根目录下读取，path不能以`/`开头

>`Test.class.getClassLoader().getResource("")=Test.class.getResource("/")`
>`Class.getResource()`里会调用`ClassLoader.getResource()`

+ [不学无数——Java动态代理](https://juejin.im/post/5b9877a2e51d450e9e43e5cb)

+ [定时任务几种实现方式](https://blog.csdn.net/revitalizing/article/details/61420556)

## ref

+ [funbook](http://www.runoob.com/java/java-tutorial.html)
+ [廖雪峰](https://www.feiyangedu.com/category/JavaSE)
+ [Stream](https://www.ibm.com/developerworks/cn/java/j-lo-java8streamapi/index.html)
+ [Java 8 新特性](http://www.runoob.com/java/java8-new-features.html)
+ [Java 注解（Annotation）](https://www.runoob.com/w3cnote/java-annotation.html)
+ [Java:Annotation(注解)--原理到案例](https://www.jianshu.com/p/28edf5352b63)
<!-- AOP -->
+ [ASM](https://www.jianshu.com/p/a1e6b3abd789)
+ [Byte Buddy 教程](https://notes.diguage.com/byte-buddy-tutorial/)
+ [「Byte Buddy」20行代码实现AOP](https://zhuanlan.zhihu.com/p/84514959)


<!-- others -->
+ [Java NIO浅析(Non-blocking I/O)](https://tech.meituan.com/2016/11/04/nio.html)
+ [Java三种代理模式：静态代理、动态代理和cglib代理](https://segmentfault.com/a/1190000011291179)
+ [关于JVM堆外内存的一切](https://juejin.cn/post/6844903710766661639)
    + [Java堆外内存：堆外内存回收方法](https://www.huaweicloud.com/articles/f48ee34757ceccdada58274492db6c9f.html)
+ [stream](https://www.liaoxuefeng.com/wiki/1252599548343744/1322402873081889)

