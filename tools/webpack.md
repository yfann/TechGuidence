# Webpack

## 介绍

一切资源皆模块,默认支持CommonJS, AMD

## config

+ entry

```
entry: {
    index : './src/js/page/index.js',
    //支持数组形式，将加载数组中的所有模块，但以最后一个模块作为输出
    page2: ["./entry1", "./entry2"]
}
```

+ output

```
output: {
    path: './build', // This is where images AND js will go
    publicPath: 'http://mycdn.com/', // This is used to generate URLs to e.g. images
    filename: '[name].bundle.js'
}
```

+ module

```
module: {
    //加载器配置
    loaders: [
        //.css 文件使用 style-loader 和 css-loader 来处理
        { test: /\.css$/, loader: 'style-loader!css-loader' },
        //.js 文件使用 jsx-loader 来编译处理
        { test: /\.js$/, loader: 'jsx-loader?harmony' },
        //.scss 文件使用 style-loader、css-loader 和 sass-loader 来编译处理
        { test: /\.scss$/, loader: 'style!css!sass?sourceMap'},
        //图片文件使用 url-loader 来处理，小于8kb的直接转为base64
        { test: /\.(png|jpg)$/, loader: 'url-loader?limit=8192'}
    ]
}
```

+ resolve

```
resolve: {
        //查找module的话从这里开始查找
        root: 'E:/github/flux-example/src', //绝对路径
        //自动扩展文件后缀名，意味着我们require模块可以省略不写后缀名
        extensions: ['', '.js', '.json', '.scss'],
        //模块别名定义，方便后续直接引用别名，无须多写长长的地址
        alias: {
            AppStore : 'js/stores/AppStores.js',//后续直接 require('AppStore') 即可
            ActionType : 'js/actions/ActionType.js',
            AppAction : 'js/actions/AppAction.js'
        }
}
```

+ entry file   

  入口文件，可以直接引入未经编译的原生文件，只要配置好相应的loader.
  
        //index.js
        require('../../css/reset.scss'); //加载初始化样式
        require('../../css/allComponent.scss'); //加载组件样式
        var React = require('react');
        var AppWrap = require('../component/AppWrap'); //加载组件
        var createRedux = require('redux').createRedux;
        var Provider = require('redux/react').Provider;
        var stores = require('AppStore');

        var redux = createRedux(stores);

        var App = React.createClass({
            render: function() {
                return (
                    <Provider redux={redux}>
                        {function() { return <AppWrap />; }}
                    </Provider>
                );
            }
        });

        React.render(
            <App />, document.body
        );       
        

## CMD

+ `webpack --display-error-details` //查看查找过程

+ `webpack --config XXX.js`   //使用另一份配置文件（比如webpack.config2.js）来打包

+ `webpack --watch`   //监听变动并自动打包

+ `webpack -p`    //压缩混淆脚本，这个非常非常重要！

+ `webpack -d`    //生成map映射文件，告知哪些模块被最终打包到哪里了

## pulgin&loader [#](https://webpack.github.io/docs/list-of-loaders.html)

+ exports-loader

        //对不规范的模块shim处理
        //config
        { test: require.resolve("./src/js/tool/swipe.js"),  loader: "exports?swipe"}
        //use
        require('./tool/swipe.js');
        swipe(); 

+ CommonsChunkPlugin

提取多个页面间的公共模块，并打包为common.js

        var CommonsChunkPlugin = require("webpack/lib/optimize/CommonsChunkPlugin");
        module.exports = {
            entry: {
                p1: "./page1",
                p2: "./page2",
                p3: "./page3",
                ap1: "./admin/page1",
                ap2: "./admin/page2"
            },
            output: {
                filename: "[name].js"
            },
            plugins: [
                new CommonsChunkPlugin("admin-commons.js", ["ap1", "ap2"]),
                new CommonsChunkPlugin("commons.js", ["p1", "p2", "admin-commons.js"])
            ]
        };
        // <script>s required:
        // page1.html: commons.js, p1.js
        // page2.html: commons.js, p2.js
        // page3.html: p3.js
        // admin-page1.html: commons.js, admin-commons.js, ap1.js
        // admin-page2.html: commons.js, admin-commons.js, ap2.js

+ extract-text-webpack-plugins

样式文件独立打包

        var webpack = require('webpack');
        var commonsPlugin = new webpack.optimize.CommonsChunkPlugin('common.js');
        var ExtractTextPlugin = require("extract-text-webpack-plugin");
    
        module.exports = {
            plugins: [commonsPlugin, new ExtractTextPlugin("[name].css")],
            entry: {
            //...省略其

+ 使用CDN远程文件



        //配置
        {
            externals: {
                // require("jquery") 是引用自外部模块的
                // 对应全局变量 jQuery
                "jquery": "jQuery"
            }
        }

        //确保CDN文件在打包文件引入前引入
        var $script = require("scriptjs");
        $script("//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js", function() {
            $('body').html('It works!')
        });

+  [react-hot-loader](https://github.com/gaearon/react-hot-loader) 


## Hot Module Replacement([HMR](https://webpack.github.io/docs/hot-module-replacement-with-webpack.html))


# Ref

+ [official](http://webpack.github.io/docs/configuration.html)

+ [Webpack 入门指迷](https://segmentfault.com/a/1190000002551952)

+ [webpack 入门指南](http://www.cnblogs.com/vajoy/p/4650467.html)