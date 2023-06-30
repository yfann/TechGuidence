# java interview

## new的过程

+ 加载类(第一使用该类)
    + CLassLoader

+ 验证、准备

+ 初始化(父->子)
    + 静态变量赋值
    + static代码块
        + 只有jvm能调用

+ 创建对象
    + 分配堆内存(不含静态变量)
    + 实例变量赋值
    + 执行初始化代码(父->子)
    + 堆地址赋给栈中的引用变量

## HashMap vs HashTable vs ConcurrentHashMap

+ HashMap 非线程安全

+ HashTable
    + synchronized保证线程安全(只有一把锁)
    + 效率低下
        + 当一个线程put时，其他线程不能put和get

+ ConcurrentHashMap
    + 锁分段(Segment，Java5)
        + 数据分段存储,每段数据配一把锁
        + 浪费空间，GC效率低
    + synchronized+cas(java8)

## 反射

+ `Class clazz=[Class].class;`

+ 创建实例
    + `Class.forName("com.User")`
    + `Object obj=clazz.newInstance(...)`
    + `Constroctor cons=clazz.getConstructor(String.class,Integer.class);`


+ class.forName() vs classLoader
    + 都可以加载类
    + `class.forName()` 
        + .class文件加载到jvm中,并解释类,执行static块
    + `classLoader`
        + .class加载到jvm中，不执行static块,newinstance才执行


## 动态代理 

+ 静态代理
    + 代理模式
    + 编译时产生代理类

+ JDK动态代理
    + Proxy.newProxyInstance
    + 利用反射机制生成一个实现代理接口的匿名类
    + 在调用具体方法前调用InvokeHandler来处理
    + JDK代理只能对实现接口的类生成代理

+ CGlib动态代理
    + 利用ASM（开源的Java字节码编辑库，操作字节码）开源包，将代理对象类的class文件加载进来，通过修改其字节码生成子类来处理。
    + CGlib是针对类实现代理，对指定的类生成一个子类，并覆盖其中的方法，这种通过继承类的实现方式，不能代理final修饰的类,不用实现接口

+ Aspectj动态代理
    + 修改目标类的字节
    + 织入代理的字节
    + 编译的时候插入动态的代理字节
    + 不生成新的Class

+ instrumentation动态代理
    + 修改目标类的字节码
    + 类装载的时候动态拦截修改
    + javaagent `-javaagent:spring-instrument-4.3.8.RELEASE.jar`
    + 不生成新的Class

## others

+ IO
    + nio
    + aio
    + reactor


## JVM

+ java code ---（前端编译器,javac）----> .class字节码 -----（运行期编译器,Just In Time Compiler,JIT）----> 机器码
    + javac 将java语法糖转为字节码
    + JIT 负责代码优化
        + Graal
            + 多语言jvm
                + Truffle framework
                    + python
                    + R
                    + javascript
                + native image

## ref
+ [java new一个对象的过程中发生了什么](https://cloud.tencent.com/developer/article/1398010)
+ [太好了！总算有人把动态代理、CGlib、AOP都说清楚了](https://cloud.tencent.com/developer/article/1461796)

+ [深入分析ConcurrentHashMap的锁分段技术](https://blog.csdn.net/rickiyeat/article/details/77367017)
<!-- jvm -->
+ [十分钟带你了解 Oracle 最新的 JVM 技術——GraalVM](https://zhuanlan.zhihu.com/p/106555993)