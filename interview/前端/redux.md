+ 什么是 Redux？（提问基础问题）

这是一个开放性问题，考察候选人对 Redux 的基本概念是否清楚。候选人应该能够简洁地解释 Redux 是什么以及它的核心概念，例如 Store、Action、Reducer 和 Dispatcher 等。

+ Redux 与 React 的关系是什么？（考察 Redux 在 React 中的应用）

这个问题考察候选人对 Redux 如何与 React 结合的了解。候选人应该能够解释 Redux 如何作为状态管理库与 React 组件配合，并提及使用 react-redux 提供的工具来简化集成过程。

+ 什么情况下使用 Redux？（考察合理使用 Redux 的判断能力）

候选人应该能够说明在什么情况下使用 Redux 是合适的。通常，Redux 更适用于大型或复杂应用程序，涉及多个组件之间共享状态和大量异步操作。

+ Redux 的核心工作流程是什么？（考察对 Redux 工作原理的了解）

候选人应该能够解释 Redux 的核心工作流程：当用户触发 Action 时，Action 被分发给 Reducer 来更新 Store 中的状态。然后，组件可以从 Store 中读取状态，并且在状态发生变化时进行更新。

+ 什么是异步 Action？如何处理异步操作？（考察处理异步操作的能力）

异步 Action 是指在处理数据获取、网络请求等异步操作时使用的 Action。候选人应该能够提到使用 Redux Thunk 或 Redux Saga 来处理异步操作，并解释为什么要使用它们。

+ Redux 中的 Reducer 是什么？（考察对 Reducer 的理解）

Reducer 是一个纯函数，用于处理 Action 并更新应用程序的状态。候选人应该能够解释 Reducer 的设计原则，并强调它必须是纯函数，不应该有副作用。

+ Redux DevTools 是什么？它有什么用处？（考察对工具的了解）

Redux DevTools 是一个浏览器插件，用于监视和调试 Redux 应用程序。候选人应该能够解释 Redux DevTools 的用途，如调试状态、查看 Action 历史记录以及时间旅行调试等。