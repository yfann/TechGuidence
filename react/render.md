# react render

## render
+ Render 阶段的目标是：计算出“下一次 UI 应该长什么样”，而不是修改 UI。
    + 可以被中断 / 恢复 / 丢弃
    + 不操作 DOM
    + 可能执行多次
    + 会执行组件函数
+ 更新（update） 触发render
    + setState / dispatch
    + props 变化
    + context 变化
    + 父组件重新 render
+ Update → UpdateQueue → scheduleUpdateOnFiber
    + 每个更新都会被赋予一个 优先级（lane）。
+ React 并不会立即 render，而是先做调度判断
    + 同步 render
    + 并发 render（时间切片，可中断）
+ process
    + 构建 workInProgress 树(双缓存机制)
    + 深度优先遍历 Fiber 树
    ```txt
    beginWork（向下）
    ↓
    child
    ↓
    sibling
    ↓
    completeWork（向上）
    ```
    + beginWork 阶段
        + 根据 Fiber 类型执行不同逻辑：
            + 函数组件
                + 执行组件函数
                + 执行 Hook
                + 生成子 React Element
            + 类组件
                + 调用 render()
            + Host 组件（DOM）
                + 处理属性
        + 新旧 Fiber 对比（diff）
        + 生成子 Fiber
        + 标记副作用（flags
    + Diff（Reconciliation）
        + 对比新旧节点
        + key 决定复用
        + 标记：(不操作 DOM，只记录“要做什么”)
            + Placement
            + Update
            + Deletion
    + completeWork 阶段
        + 子节点完成后回溯
        + 收集子树副作用
        + 构建 effect list
        + 准备进入 commit

## commit
+ 一次性、原子性地把 render 结果应用到真实环境。
    + 不可中断
    + 一次完成
    + 修改dom

+ process
    + Before Mutation
        + 执行 getSnapshotBeforeUpdate
        + 读取DOM
    + Mutation
        + 更新DOM
    + Layout
        + 执行 useLayoutEffect
        + 执行类组件生命周期
        + 更新 ref

## useEffect
+ 用来在组件 render 并提交到 DOM 之后，执行与渲染结果相关的副作用逻辑
+ 副作用
    + 不纯粹由 props/state 决定、会影响外部世界或依赖外部世界的操作
    + 包括
        + 网络请求
        + 订阅 / 取消订阅
        + 操作 DOM
        + 定时器
        + 日志、埋点
        + 与非 React 系统交互
    + 不应该发生在 render 阶段，因为 render 必须是
        + 纯函数
        + 可重复
        + 可中断
+ commit后异步执行
    + 不阻塞渲染
    + 不影响布局计算
```txt
Render（计算 UI）
  ↓
Commit（DOM 更新）
  ↓
浏览器绘制
  ↓
useEffect（异步执行）

```
## render process
```txt
更新触发
  ↓
调度（Scheduler）
  ↓
Render（Reconciliation）
  ├─ 执行组件 / Hooks
  ├─ Diff，打 flags
  └─ 构建 workInProgress
  ↓
Commit
  ├─ beforeMutation
  ├─ mutation（DOM）
  └─ layout
  ↓
useEffect（异步）

```