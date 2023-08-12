
## TCC
+ TCC Transaction：能够支持广义的分布式事务. 架构中每个模块需要改造成实现 Try/Confirm/Cancel 能力的 TCC 组件，通过事务协调器进行全局 Try——Confirm/Cancel 两阶段流程的串联，保证数据的最终一致性趋近于 100%
+ TCC 本质上是一个两阶段提交（Two Phase Commitment Protocol，2PC）的实现方案，分为 Try 和 Confirm/Cancel 的两个阶段
    + Try 操作的容错率是比较高的，原因在于有人帮它兜底. Try 只是一个试探性的操作，不论成功或失败，后续可以通过第二轮的 Confirm 或 Cancel 操作对最终结果进行修正
    + Confirm/Cancel 操作是没有容错的，倘若在第二阶段出现问题，可能会导致 Component 中的状态数据被长时间”冻结“或者数据状态不一致的问题
        + 在第二阶段中，TX Manager 轮询重试 + TCC Component 幂等去重. 通过这两套动作形成的组合拳，保证 Confirm/ Cancel 操作至少会被 TCC Component 执行一次
+ process
    + Application 调用 TX Manager 的接口，创建一轮分布式事务：
        + Application 需要向 TX Manager 声明，这次操作涉及到的 TCC Component 范围，包括 订单组件、账户组件和库存组件
        + Application 需要向 TX Manager 提前传递好，用于和每个 TCC Component 交互的请求参数（ TX Manager 调用 Component Try 接口时需要传递）
    + TX Manager 需要为这笔新开启的分布式事务分配一个全局唯一的事务主键 Transaction ID
    + TX Manager 将这笔分布式事务的明细记录添加到事务日志表中
    + TX Manager 分别调用订单、账户、库存组件的 Try 接口，试探各个子模块的响应状况，比并尝试锁定对应的资源
    + TX Manager 收集每个 TCC Component Try 接口的响应结果，根据结果决定下一轮的动作是 Confirm 还是 Cancel
    + 倘若三笔 Try 请求中，有任意一笔未请求成功：
    + TX Manager 给予 Application 事务执行失败的 Response
    + TX Manager 批量调用订单、账户、库存 Component 的 Cancel 接口，回滚释放对应的资源
    + 在三笔 Cancel 请求都响应成功后，TX Manager 在事务日志表中将这笔事务记录置为【失败】状态
    + 倘若三笔 Try 请求均响应成功了：
    + TX Manager 给予 Application 事务执行成功的 ACK
    + TX Manager 批量调用订单、账户、库存 Component 的 Confirm 接口，使得对应的变更记录实际生效
    + 在三笔 Confirm 请求都响应成功后，TX Manager 将这笔事务日志置为【成功】状态

+ TX Manager
    + 暴露出注册 TCC Component 的接口，进行 Component 的注册和管理
    + 暴露出启动分布式事务的接口，作为和 Application 交互的唯一入口，并基于 Application 事务执行结果的反馈
    + 为每个事务维护全局唯一的 Transaction ID，基于事务日志表记录每项分布式事务的进展明细
    + 串联 Try——Confirm/Cancel 的两阶段流程，根据 Try 的结果，推进执行 Confirm 或 Cancel 流程
    + 持续运行轮询检查任务，推进每个处于中间态的分布式事务流转到终态

+ TCC Component 
    + 暴露出 Try、Confirm、Cancel 三个入口，对应于 TCC 的语义
    + 针对数据记录，新增出一个对应于 Try 操作的中间状态枚举值
    + 针对于同一笔事务的重复请求，需要执行幂等性校验
    + 需要支持空回滚操作. 即针对于一笔新的 Transaction ID，在没收到 Try 的前提下，若提前收到了 Cancel 操作，也需要将这个信息记录下来，但不需要对真实的状态数据发生变更

+ 优势
    + TCC 可以称得上是真正意义上的分布式事务：任意一个 Component 的 Try 操作发生问题，都能支持事务的整体回滚操作
    + TCC 流程中，分布式事务中数据的状态一致性能够趋近于 100%，这是因为第二阶段 Confirm/Cancel 的成功率是很高的，原因在于如下三个方面：
        + TX Manager 在此前刚和 Component 经历过一轮 Try 请求的交互并获得了成功的 ACK，因此短时间内，Component 出现网络问题或者自身节点状态问题的概率是比较小的
        + TX Manager 已经通过 Try 操作，让 Component 提前锁定了对应的资源，因此确保了资源是充分的，且由于执行了状态锁定，出现并发问题的概率也会比较小
        + TX Manager 中通过轮询重试机制，保证了在 Confirm 和 Cancel 操作执行失败时，也能够通过重试机制得到补偿
+ 劣势
    + TCC 分布式事务中，涉及的状态数据变更只能趋近于最终一致性，无法做到即时一致性
    + 事务的原子性只能做到趋近于 100%，而无法做到真正意义上的 100%，原因就在于第二阶段的 Confirm 和 Cancel 仍然存在极小概率发生失败，即便通过重试机制也无法挽救. 这部分小概率事件，就需要通过人为介入进行兜底处理
    + TCC 架构的实现成本是很高的，需要所有子模块改造成 TCC 组件的格式，且整个事务的处理流程是相对繁重且复杂的. 因此在针对数据一致性要求不那么高的场景中，通常不会使用到这套架构.