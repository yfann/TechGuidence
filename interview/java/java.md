# java 


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


## tips
+ abstract vs interface
    + 抽象类可以有构造方法，接口不能有构造方法。
    + 抽象类可以有成员变量，接口只能有常量（静态和 final）。
    + 抽象类用于表示一种类型的通用行为，而接口用于定义一组相关的操作。
    + 抽象类适用于一组相关类之间的继承关系，而接口适用于类之间的多态性和实现一组共享行为的契约

+ 多态（Polymorphism）
    + 子类对象可以被当作父类类型引用
    + 子类可以重写（Override）继承自父类的方法

+ static vs final
    + static（属于类）
        + 修饰类的变量，类加载时被初始化
        + 使用 static 关键字定义的代码块在类加载时执行，用于进行类的初始化操作。
    + final （不可变）
        + 使用 final 关键字修饰的变量是一个常量，其值在初始化后不能被修改。一旦被赋值后，final 变量的值就不能再改变
        + 使用 final 关键字修饰的方法不能被子类重写（覆盖），保证了方法的一致性。
        + 使用 final 关键字修饰的类不能被继承，即它是一个最终类，不允许其他类继承它。
    + final static
        + 这样定义的常量具有不可修改的特性，并且在内存中只有一份副本，可以被所有类的实例共享

+ 实现同步
    + synchronized
    + 使用锁

+ annotation
    + 是一种元数据，用于为程序中的元素（类、方法、变量等）提供额外的信息.注解可以被编译器、开发工具和框架等使用，用于提供配置、验证、文档化等功能。注解使用 @ 符号放置在目标元素前面。

+ 泛型的用途
    + 类型安全
    + 代码重用
## ref
+ [你在java面试中被问过什么让你觉得对方逼格很高的问题？](https://www.zhihu.com/question/53673888/answer/2919030279)
+ [史上最全阿里 Java 面试题总结](https://segmentfault.com/a/1190000016172470)

+ [java new一个对象的过程中发生了什么](https://cloud.tencent.com/developer/article/1398010)
+ [太好了！总算有人把动态代理、CGlib、AOP都说清楚了](https://cloud.tencent.com/developer/article/1461796)

+ [深入分析ConcurrentHashMap的锁分段技术](https://blog.csdn.net/rickiyeat/article/details/77367017)
<!-- jvm -->
+ [十分钟带你了解 Oracle 最新的 JVM 技術——GraalVM](https://zhuanlan.zhihu.com/p/106555993)