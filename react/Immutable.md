[Immutable 详解及 React 中实践](https://zhuanlan.zhihu.com/p/20295971)

##JS mutable Object

    var foo={a: 1}; 
    var bar=foo; 
    bar.a=2
    //foo.a也改成了2

节约了内存，但也造成了隐患。(一般用shallowCopy,deepCopy来避免修改,会造成CPU和内存浪费)

##Immutable Data

+ 对Immutable对象的修改会返回新的Immutable对象。
+ 原理:Persistent Data Structure 
+ Structural Sharing(对象树中如果一个节点发生变化，只修改这个节点和受它影响的父节点，其他节点共享)
    
     避免了deepCopy复制每个节点的性能损耗
     
##libs

+ immutable.js
+ seamless-immutable

##React 优化

+ shouldComponentupdate()

    return true：
        1. render（）
        2. Virtual DOM diff
        3. Update real DOM

+ immutable

    import { is } from 'immutable';
    shouldComponentUpdate: (nextProps, nextState) => {
    return !(this.props === nextProps || is(this.props, nextProps)) ||
            !(this.state === nextState || is(this.state, nextState));
    }
