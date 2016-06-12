#FLUX

##Action contains
+ api
+ constant(action type)
+ dispatcher(dispatcher action result)    `Dispatcher.dispatch(...)`

##Store contains
+ initial state
+ method to get state
+ dispatcher(hander action result,notify observers)
+ method to register observer(when state changes to notify obersers to get new state)

##Controler view contains
+ store(get state)
+ action

#Redux

##Action contains
+ api
+ constant(action type)

##Reducer
+ constant(action type)
+ initial state