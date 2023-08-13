# saga
+ 协议
    + 每个saga食物由一系列幂等有序子事务(sub-transaction)Ti组成
        + 长事务拆成多个本地短事务
    + 每个Ti都有对应的幂等补偿动作Ci,补偿动作用于测小Ti造成的结果

+ 处理事务异常
    + 向后恢复(backward recovery)
        + 事务失败时，补偿所有已完成的事务，一退到底
    + 向前恢复(forward recovery)
        + 对于执行不通的事务，会尝试重试事务，假设每个子事务都会成功

+ 事务实现方式
    + 命令协调（Order Orchestrator）
        + 中央协调器（Orchestrator,OSO）
            + 以命令/回复的方式与没想服务通信，告诉每个参与者什么时候该做什么
            + 有单点风险
    + 事件编排(Event Choreographyp)
        + 没有OSO,每个服务产生并观察其他服务的事件，并决定是否采取行动
        + 

