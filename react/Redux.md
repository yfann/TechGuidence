# [Redux](http://camsong.github.io/redux-in-chinese/index.html)

+ 单一store,存储state stree
+ 没有Dispatcher
+ reducer函数:决定action如何改变state`(state,action)=>state`,只返回新的state不改变原state
+ 有根级reducer(随应用规模拆成多个小的reducers)
+ 改变state的唯一方式是 触发action `store.dispatch({...})`
+ 单向数据流，所有数据生命周期相同

## 3 principles

+ single store
+ readonly state
+ pure function reducer

# Action

action 可以被序列化

+ 普通action
```
...
dispatch(addTodo(text))

const boundAddTodo = (text) => dispatch(addTodo(text))
boundAddTodo(text);
```
+ 有逻辑的action
```
export function addTodo(text) {
  // Redux Thunk 中间件允许这种形式
  // 在下面的 “异步 Action Creators” 段落中有写
  return function (dispatch, getState) {
    if (getState().todos.length === 3) {
      // 提前退出
      return;
    }

    dispatch(addTodoWithoutCheck(text));
  }
}
```
+ generate action creator
```
function makeActionCreator(type, ...argNames) {
  return function(...args) {
    let action = { type }
    argNames.forEach((arg, index) => {
      action[argNames[index]] = args[index]
    })
    return action
  }
}

const ADD_TODO = 'ADD_TODO'
const EDIT_TODO = 'EDIT_TODO'
const REMOVE_TODO = 'REMOVE_TODO'

export const addTodo = makeActionCreator(ADD_TODO, 'todo')
export const editTodo = makeActionCreator(EDIT_TODO, 'id', 'todo')
export const removeTodo = makeActionCreator(REMOVE_TODO, 'id')
```



+ 异步Action Creators


```
//actionCreators.js

export function loadPostsSuccess(userId, response) {
  return {
    type: 'LOAD_POSTS_SUCCESS',
    userId,
    response
  };
}

export function loadPostsFailure(userId, error) {
  return {
    type: 'LOAD_POSTS_FAILURE',
    userId,
    error
  };
}

export function loadPostsRequest(userId) {
  return {
    type: 'LOAD_POSTS_REQUEST',
    userId
  };
}
```
```
//UserInfo.js

import { Component } from 'react';
import { connect } from 'react-redux';
import { loadPostsRequest, loadPostsSuccess, loadPostsFailure } from './actionCreators';

class Posts extends Component {
  loadData(userId) {
    // 调用 React Redux `connect()` 注入 props ：
    let { dispatch, posts } = this.props;

    if (posts[userId]) {
      // 这里是被缓存的数据！啥也不做。
      return;
    }

    // Reducer 可以通过设置 `isFetching` 响应这个 action
    // 因此让我们显示一个 Spinner 控件。
    dispatch(loadPostsRequest(userId));

    // Reducer 可以通过填写 `users` 响应这些 actions
    fetch(`http://myapi.com/users/${userId}/posts`).then(
      response => dispatch(loadPostsSuccess(userId, response)),
      error => dispatch(loadPostsFailure(userId, error))
    );
  }

  componentDidMount() {
    this.loadData(this.props.userId);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.userId !== this.props.userId) {
      this.loadData(nextProps.userId);
    }
  }

  render() {
    if (this.props.isLoading) {
      return <p>Loading...</p>;
    }

    let posts = this.props.posts.map(post =>
      <Post post={post} key={post.id} />
    );

    return <div>{posts}</div>;
  }
}

export default connect(state => ({
  posts: state.posts
}))(Posts);
```
```
//使用redux-thunk 上面的代码：
//actionCreators.js

export function loadPosts(userId) {
  // 用 thunk 中间件解释：
  return function (dispatch, getState) {
    let { posts } = getState();
    if (posts[userId]) {
      // 这里是数据缓存！啥也不做。
      return;
    }

    dispatch({
      type: 'LOAD_POSTS_REQUEST',
      userId
    });

    // 异步分发原味 action
    fetch(`http://myapi.com/users/${userId}/posts`).then(
      response => dispatch({
        type: 'LOAD_POSTS_SUCCESS',
        userId,
        respone
      }),
      error => dispatch({
        type: 'LOAD_POSTS_FAILURE',
        userId,
        error
      })
    );
  }
}
```
```
//UserInfo.js

import { Component } from 'react';
import { connect } from 'react-redux';
import { loadPosts } from './actionCreators';

class Posts extends Component {
  componentDidMount() {
    this.props.dispatch(loadPosts(this.props.userId));
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.userId !== this.props.userId) {
      this.props.dispatch(loadPosts(nextProps.userId));
    }
  }

  render() {
    if (this.props.isLoading) {
      return <p>Loading...</p>;
    }

    let posts = this.props.posts.map(post =>
      <Post post={post} key={post.id} />
    );

    return <div>{posts}</div>;
  }
}

export default connect(state => ({
  posts: state.posts
}))(Posts);
```

+ bindActionCreators

## Ref

+ [Flux 标准 Action](https://github.com/acdlite/flux-standard-action)

# Reducer

```
(previousState, action) => newState

可以传给
Array.prototype.reduce(reducer, ?initialValue) 
```
+ redux用reducer纯函数代替了flux 中的event emitter

## State

+ 初始化state
+ 把state想象成数据库
+ [normalizr](https://github.com/paularmstrong/normalizr)

## 拆分Reducer


```
//合并reducer
function todoApp(state = {}, action) {
  return {
    visibilityFilter: visibilityFilter(state.visibilityFilter, action),
    todos: todos(state.todos, action)
  }
}

//或
const todoApp = combineReducers({
  visibilityFilter,
  todos
})

```

# Store

+ Redux应用中只有一个store

```
import todoApp from './reducers'
let store = createStore(todoApp)
```
```
import { addTodo, toggleTodo, setVisibilityFilter, VisibilityFilters } from './actions'

// 打印初始状态
console.log(store.getState())

// 每次 state 更新时，打印日志
// 注意 subscribe() 返回一个函数用来注销监听器
let unsubscribe = store.subscribe(() =>
  console.log(store.getState())
)

// 发起一系列 action
store.dispatch(addTodo('Learn about actions'))
store.dispatch(setVisibilityFilter(VisibilityFilters.SHOW_COMPLETED))

// 停止监听 state 更新
unsubscribe();

```

# Container 

+ 可以访问store的dispatch(index中通过provider注入store)
```
...
<AddTodo onAddClick={
    text=>dispatch(addTodo(text))
}/>
...
```
+ 可以注入需要的属性
```
...
export default connect(select)(App);
```

# Redux Middleware

## [Redux Thunk](https://github.com/gaearon/redux-thunk)

+ action creator 返回函数取代直接返回action
+ 可以延时dispatch action
+ 可以根据条件dispatch action
