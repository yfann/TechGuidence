[脚手架](https://github.com/ant-design/antd-init)
[组件生成脚手架](https://github.com/react-component/generator-rc)
[antd例子](https://github.com/react-component/checkbox/blob/master/src/Checkbox.jsx)


+ dora


+ bind

        bind 每次产生新的函数，一般放在constructor中
        return (<div>
            {UserNodes}
            <button onClick={this.addUser.bind(this)}>Add</button>
        </div>)

        <button onClick={::this.addUser}>Add</button>

+ 生命周期
    mount 组件第一次加载
    update 组件的更新
    willReceiverProps 