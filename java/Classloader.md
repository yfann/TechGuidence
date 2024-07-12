# java classLoader
+ 类加载过程
    + 加载->连接（验证->准备->解析）->初始化
+ JVM 判定两个 Java 类是否相同的具体规则：
    + JVM 不仅要看类的全名是否相同，还要看加载此类的类加载器是否一样。只有两者都相同的情况，才认为两个类是相同的。即使两个类来源于同一个 Class 文件，被同一个虚拟机加载，只要加载它们的类加载器不同，那这两个类就必定不相同。

## ClassLoader
+ 将.class文件加载到JVM中，内存中生成一个代表该类的Class对象
+ 还可以加载资源文件(文本，图像，配置文件等)
+ JVM启动时不会一次性加载所有的类，根据需要动态加载
+ 数组类不是通过ClassLoader加载的，JVM直接创建
+ Java的类加载器是分层次的，每个类加载器实例在内存中是独立的，即使它们加载的是相同的类，JVM也会认为它们是不同的类。
+ 不会初始化类

+ ClassLoader种类
    + BootstrapClassLoader
        + 加载JDK内部的核心类（%JAVA_HOME%/lib）
        + `-Xbootclasspath`指定路径下的类
        +  获取到 ClassLoader 为null就是 BootstrapClassLoader 加载的
        + JVM自身的一部分
    + ExtensionClassLoader
        + `%JRE_HOME%/lib/ext`
        + java.ext.dirs系统变量指定路径下的类
    + AppClassLoader
        + 加载当前应用 classpath 下的所有 jar 包和类

+ 双亲委派模型
    + 每个ClassLoader都有一个父类ClassLoader
    + 查找类或资源时把委托交给父类
        + 每当一个类加载器接收到加载请求时，它会先将请求转发给父类加载器。在父类加载器没有找到所请求的类的情况下，该类加载器才会尝试去加载。
    + JVM中BootstrapClassLoader是顶层类，没有父类
    + 优点
        + 避免重复加载

+ Custom ClassLoader
    + loadClass()
        + 实现了双亲委派机制
    + findClass()
        + 可以重写

    + 加载过程先loadClass(),再findClass(),没有找到抛ClassNotFoundException 

+ ThreadContextClassLoader

+ code
```java
Thread.currentThread().getContextClassLoader();

```

##  Class.forName
+ 运行时根据类的名称返回Class对象
+ 会初始化类
    + 执行静态初始化块

+ code
```java
`Class<?> clazz = Class.forName("com.example.MyClass");
//可以选择class loader
Class<?> clazz = Class.forName("com.example.MyClass",true,loader);
```

## tips
+ 方法区
    + 方法区属于是 JVM 运行时数据区域的一块逻辑区域，是各个线程共享的内存区域。当虚拟机要使用一个类时，它需要读取并解析 Class 文件获取相关信息，再将信息存入到方法区。方法区会存储已被虚拟机加载的 类信息、字段信息、方法信息、常量、静态变量、即时编译器编译后的代码缓存等数据。




## ref
+ [类加载过程详解](https://javaguide.cn/java/jvm/class-loading-process.html)
+ [Java内存区域详解（重点）](https://javaguide.cn/java/jvm/memory-area.html)