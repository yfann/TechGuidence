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

+ JDK动态代理
    + 利用反射机制生成一个实现代理接口的匿名类，在调用具体方法前调用InvokeHandler来处理。
    + JDK代理只能对实现接口的类生成代理

+ CGlib动态代理
    + 利用ASM（开源的Java字节码编辑库，操作字节码）开源包，将代理对象类的class文件加载进来，通过修改其字节码生成子类来处理。
    + CGlib是针对类实现代理，对指定的类生成一个子类，并覆盖其中的方法，这种通过继承类的实现方式，不能代理final修饰的类

## others

+ IO
    + nio
    + aio
    + reactor



## ref
+ [java new一个对象的过程中发生了什么](https://cloud.tencent.com/developer/article/1398010)