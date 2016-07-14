+ 事件绑定

```
//bind 每次产生新的函数，一般放在constructor中

return (<div>
            {UserNodes}
            <button onClick={this.addUser.bind(this)}>Add</button>
        </div>)
        
//es6的bind写法
<button onClick={::this.addUser}>Add</button
```
