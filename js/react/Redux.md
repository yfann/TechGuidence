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

##Concept

+ Action  

把数据重应用传到store的有效荷载。store数据的唯一来源。  
`store.dispatch(actionCreator(value))`将action传到store

+ State

[State范式化](https://github.com/paularmstrong/normalizr)

+ Reducer

无副作用的纯函数`(previousState, action) => newState`
    //拆分reducer,每个子reducer处理state中的一部分数据，然后合并大对象。
    function todos(state = [], action) {
      switch (action.type) {
        case ADD_TODO:
          return [...state, {
            text: action.text,
            completed: false
          }];
        case COMPLETE_TODO:
          return [
            ...state.slice(0, action.index),
            Object.assign({}, state[action.index], {
              completed: true
            }),
            ...state.slice(action.index + 1)
          ];
        default:
          return state;
      }
    }
    
    function visibilityFilter(state = SHOW_ALL, action) {
      switch (action.type) {
        case SET_VISIBILITY_FILTER:
          return action.filter;
        default:
          return state;
      }
    }
    
    function todoApp(state = {}, action) {
      return {
        visibilityFilter: visibilityFilter(state.visibilityFilter, action),
        todos: todos(state.todos, action)
      };
    }
    
+ Store 
    - 单一store(reducer组合代替多个store)
    - 维护state
    - getState()获取state
    - dispatch(action)更新state
    - suscibe(listener)注册监听器
    
    import { createStore } from 'redux'
    import todoApp from './reducers'

    let store = createStore(todoApp)
