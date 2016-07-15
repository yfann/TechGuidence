# FLUX([sample](http://www.ruanyifeng.com/blog/2016/01/flux.html?utm_source=tuicool&utm_medium=referral))

## Action 
+ call restfull api
+ constant(action type)
+ trigger dispatch(dispatch action result)    `Dispatcher.dispatch(...)`

## Dispatcher(use tool to build)
+ 引用store
+ 编写路由方法(dispatch.register): 通过switch actionType调用store的对应方法，对数据做添加删除等操作以及触发store.emitChange()

## Store 
+ 闭包一个内部对象，保存state
+ 暴露方法增删改查闭包对象
+ 实现事件的触发，注销，广播

##Container View
+ 引用action,编写子组件的事件函数(包含对action的调用), 事件函数通过属性传到子组件中
+ 引用Store
   - 编写change方法从store获取state,并通过setState设置返回的数据刷新view
   - 在componentDidMount,componentWillUnmout时通过store注册，注销change方法


#Redux

##Action Function
+ call restfull api
+ constant(action type)
+ 可以是异步非纯函数

##Reducer

Focus on contruct state and how to update different parts of state

+ constant(action type)
+ initial state
+ method to update state `(state,action)=>state`


##Store(use tool to build)

+ store.dispatch()

##Container View
+ action


##Components View
only reads props