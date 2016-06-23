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
    
##Ref

+ [Advanced Performance](https://facebook.github.io/react/docs/advanced-performance.html)