# Fiber
+ Fiber 是 React 用来描述、调度和执行组件更新的最小工作单元
+ 每一个 React 元素（组件、DOM 节点）,在运行时都会对应一个 Fiber 节点
+ Fiber 是最小工作单元
    + render是一个fiber一个fiber的渲染
    + 每处理完一个 Fiber，React 都可以：
        + 暂停
        + 让出主线程
        + 稍后继续
+ Fiber 是“虚拟调用栈”
    + 旧架构依赖 JS 调用栈（不可中断）
    + Fiber 把调用栈显式化成数据结构
        + 父 → 子 → 兄弟

+ Fiber 的双树结构
    + current Tree（屏幕上）
    + workInProgress Tree（内存中构建）
    + 更新流程：
        + 从 current 克隆到 workInProgress
        + 在 WIP 上计算更新
        + commit 阶段一次性替换
+ 把“一次性递归渲染”拆成“可调度的 Fiber 单元”
    + 并发渲染（Concurrent Rendering）

## fiber work process 
+ Render（可中断）
    + 构建 / 更新 workInProgress Fiber Tree
    + 执行函数组件
    + 调用 Hooks
    + 不会操作 DOM
    + 可以打断，恢复，丢弃
+ Commit（不可中断）
    + 应用 DOM 更新
    + 执行 layout effects
    + 更新 refs
    + 必须一次完成，保证 UI 一致性。


## fiber and hook
+ 每个函数组件 Fiber 持有自己的 Hook 链表
    + render 时沿链表顺序消费 Hook
    + 顺序一旦错，链表错位
```text
Fiber.memoizedState
   ↓
hook0 -> hook1 -> hook2
```
+ Hook 是挂在 Fiber 上的，而不是组件函数本身