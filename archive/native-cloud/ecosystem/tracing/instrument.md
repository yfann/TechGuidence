

## instrumentation
+ 字节码插桩
+ 无法定义新类
+ `java.lang.instrument.Instrumentation`
    + Instrumentation可以实现在方法插入额外的字节码从而达到收集使用中的数据到指定工具的目的。由于插入的字节码是附加的，这些更变不会修改原来程序的状态或者行为。通过这种方式实现的良性工具包括监控代理、分析器、覆盖分析程序和事件日志记录程序等等。
    + 底层依赖JVMTI(JVM tool Interface)
        + 基于事件驱动
        + JVMTIAgent
            + 动态库
                + agent on attach/agent on unload
    + instrument agent是一类JVMTIAgent
        + JPLISAgent(Java Programming Language Instrumentation Services Agent)

## ref
+ [instrument](https://cloud.tencent.com/developer/article/1650113)