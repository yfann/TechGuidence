#FLUX

##Action 
+ api
+ constant(action type)
+ trigger dispatch(dispatch action result)    `Dispatcher.dispatch(...)`

##Dispatcher(use tool to build)

##Store 
+ initial state
+ method to get state
+ dispatcher(handle action result,notify observers)
+ method to register observer(when state changes to notify obersers to get new state)

##Container View
+ store(get state)
+ action


#Redux

##Action Function
+ api
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