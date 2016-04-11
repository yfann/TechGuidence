#FLUX

##WORKFLOW

单向数据流

View -> Action -> Dispatcher -> Store -> Controller View -> View

1. View 告知 Action Creator创建一个 Action

2. Action Creator 创建好 action 并发送给 Dispatcher

3. Dispatcher 顺序将 action 传递给注册的store   

4. 每个Store 都会接受 Action, 自行判断是否对action 做出响应，更新 state
   更新完毕后 Store 会通知订阅了该Store的 Controller View

5. Controller View 就会向 Store请求最新的 state

6. Controller View  会把得到的 state 传递给各个子 view 渲染state

##TERMS

+ Action 由 Action Creator 创建,一旦action创建好, Action Creator 就会把它传递给 Dispatcher

+ Dispatcher 是回调函数登记表，登记者所有需要发送action 的 store, 当一个action传递过来，它会把action 传递给各个store(同步进行)

+ Store 是 state 的容器，在 Dispatcher 中注册, 接受所有 action, 内部 switch 来过滤所关心的 action, 并对 State 做变更

+ Controller View  当 Store 改变 state 时会通知 Controller View, Controller View 获取最新的 state 并传递给下面的各个 View 
 
+ View 把数据渲染成 html 

##启动流程

只启动一次

1. Store 注册到 Dispatcher

2. Controller View 从 Store 获取最新的 state

3. Controller View 把 State 传递给他所管辖的子View

4. Controller View 订阅 Store, 让 store 在 state变化时通知自己

##实践

+ Action
    - 引用restful API
    - 引用constants作为action type
    - 调用restful API，然后把返回结果连同action type一起通过Dispatcher.dispatch({...})
+ Dispatcher
    - 同步
    - Dispatcher.waitFor()可以实现等待某些store更新完后再更新
    - 会把action传递给所有store,store内部做过滤
+ Store
    - 过滤action
    - 缓存数据
    - 接收Action返回的数据Dispatcher.register()
    - 数据改变时触发事件，调用注册的方法(通知取数据)
+ Controller View
    - 管理state和底层View
    - 向UI和Store注册方法(定义event handler，何时取数据)
    - 调用Action
    - 错误验证
    - 底层View,只根据props渲染UI


[Ref](http://zhuanlan.zhihu.com/FrontendMagazine/20263396)