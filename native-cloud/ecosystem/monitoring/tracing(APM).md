# APM(Application Performance Monitor)
+ tracer
    + 在广义上，一个trace代表了一个事务或者流程在（分布式）系统中的执行过程。trace 是多个 span组成的一个有向无环图（DAG），每一个span代表trace中被命名并计时的连续性的执行片段
+ span
    + 一个span代表系统中具有开始时间和执行时长的逻辑运行单元。span之间通过嵌套或者顺序排列建立逻辑因果关系。

## tools
+ zipkin
+ skywalking
+ pinpoint
+ jaeger

## ref
+ [APM 原理与框架选型](https://www.cnblogs.com/xiaoqi/p/apm.html)