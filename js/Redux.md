#[Redux](http://camsong.github.io/redux-in-chinese/index.html)

+ 单一store,存储state stree
+ 没有Dispatcher
+ reducer函数:决定action如何改变state`(state,action)=>state`,只返回新的state不改变原state
+ 有根级reducer(随应用规模拆成多个小的reducers)
+ 改变state的唯一方式是 触发action `store.dispatch({...})`

##3 principles

+ single store
+ readonly state
+ pure function reducer