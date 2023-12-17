# java动态代理
+ Java动态代理是一种在运行时创建代理对象的机制，而不是在编译时创建。它允许在运行时生成一个实现一组接口的代理类，并且可以将代理对象绑定到InvocationHandler接口的实现。动态代理通常用于实现AOP（面向切面编程）和其他一些横切关注点（cross-cutting concerns）。


## JDK动态代理
+ 基于接口的动态代理
+ 这是Java标准库提供的动态代理机制。它基于接口，使用java.lang.reflect.Proxy类和InvocationHandler接口。代理类在运行时动态生成，实现了指定接口，并由InvocationHandler处理实际的方法调用。


##  基于类的动态代理（CGLIB动态代理）
+ CGLIB（Code Generation Library）是一个强大的，高性能的代码生成库，它可以在运行时动态生成字节码。CGLIB动态代理不要求被代理类必须实现接口，它通过继承被代理类来生成代理对象。


## tips
+ JDK动态代理更加灵活，但要求被代理类实现接口；而CGLIB动态代理则不要求接口，但生成的代理类不能处理final方法和final类。