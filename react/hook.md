# react hook
+ 让状态和副作用逻辑可以在函数组件中，以更可组合、更可预测的方式存在。
+ 调用顺序即身份（Call Order is Identity）
    + React 不是通过变量名、函数名来识别 Hook
    + 通过本次 render 中第几个 Hook 调用，来识别hook

+ quick start
    + initial 只在首次 render 生效
    + setState
        + 不立即修改 state
        + 放入更新队列
        + 触发 Fiber 调度（Scheduler）
```ts
const [state, setState] = useState(initial)
```
## useState

## useContext
+ 从祖先组件接收信息，而无需将其作为 props 传递