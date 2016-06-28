##React Performance
+ DOMDiff
+ shouldComponentupdate()

    return true：
        1. render（）
        2. Virtual DOM diff
        3. Update real DOM
        
+ PureRenderMixin

  内部通过属性对比，使用shouldComponentUpdate,对对象使用`===`
  

+ immutable(兼容shouldComponentupdate,PureRenderMixin的`===`比较)

  变化的部分产生新的引用，不变的部分引用不变。
   
    import { is } from 'immutable';
    shouldComponentUpdate: (nextProps, nextState) => {
    return !(this.props === nextProps || is(this.props, nextProps)) ||
            !(this.state === nextState || is(this.state, nextState));
    }

##immutable优化原理

1. react内部提供shouldComponentUpdate(),默认返回true,组件每次都渲染。  
2. PureRenderMixin重写了shouldComponentUpdate(),内部用`===`比较新老props和state.  
3. 2中产生了隐患，如果新的props/state修改了复杂对象的引用，则即使对象内容相同也会渲染，如果没有修改引用只修改了内容
   则`===`总返回true组件不会渲染.
    //如果只修改了detail.name，则总返回true, 如果修改了detail的引用则总返回false
    props.detail ===nextProps.detail
4. immutable.js 实现了如果只修改了对象树的部分，则被修改的节点和其祖先节点的引用都会改变。(immutable不可修改只返回新的)
   其余未修改部分的节点引用不变。`is(this.props, nextProps)` 会用hash比较内容(比deep compare性能高)
 


##Ref

+ [Advanced Performance](https://facebook.github.io/react/docs/advanced-performance.html)
+ [Pure render decorator](https://segmentfault.com/a/1190000004290333)