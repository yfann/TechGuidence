# std::collections::BinaryHeap
+ 优先队列（priority queue）
    + 你可以在 O(log n) 时间内插入元素，并在 O(log n) 时间内取出当前优先级最高的元素。因此它适用于任何“每次都要快速选出最优/最小/最大项”的场景。

+ 适合场景
    + 只关心堆顶元素
    + 不需要查找任意元素，删除中间元素，更新已有元素优先级

## 用途
+ Top-K / 第 K 大（小）元素
    + 从海量数据中找最大的 100 个数
    + O(n log k)
+ 多路有序合并（k-way merge）
    + 
+ 图算法：Dijkstra / Prim
    + 堆中存 (distance, node)
    + 每次取当前距离最小的节点
+ 事件/任务调度
    + 谁最先到期，先处理谁