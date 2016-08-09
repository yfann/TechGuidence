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
    path: './build', //生成build所在的路径
    publicPath: 'http://mycdn.com/', //html 外链的js,css路径，(也可外链path,但会使hmr失效)
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



## CMD

+ `webpack --display-error-details` //查看查找过程

+ `webpack --config XXX.js`   //使用另一份配置文件（比如webpack.config2.js）来打包

+ `webpack --watch`   //监听变动并自动打包

+ `webpack -p`    //压缩混淆脚本,build for production

```
"deploy": "NODE_ENV=production webpack -p"
```

+ `webpack -d`    //生成map映射文件，告知哪些模块被最终打包到哪里了

## pulgin&loader [#](https://webpack.github.io/docs/list-of-loaders.html)

+ exports-loader

```
//对不规范的模块shim处理
//config
{ test: require.resolve("./src/js/tool/swipe.js"),  loader: "exports?swipe"}
//use
require('./tool/swipe.js');
swipe(); 
```
+ CommonsChunkPlugin

提取多个页面间的公共模块，并打包为common.js

```
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

// page1.html: commons.js, p1.js
// page2.html: commons.js, p2.js
// page3.html: p3.js
// admin-page1.html: commons.js, admin-commons.js, ap1.js
// admin-page2.html: commons.js, admin-commons.js, ap2.js
```
Vendor libs 单独打包

```
  entry: {
    app: './main.js',
    vendor: ['jquery'],
  },
  output: {
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.optimize.CommonsChunkPlugin(/* chunkName= */'vendor', /* filename= */'vendor.js')
  ]
```


+ extract-text-webpack-plugins
样式文件独立打包
```
var webpack = require('webpack');
var commonsPlugin = new webpack.optimize.CommonsChunkPlugin('common.js');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
    plugins: [commonsPlugin, new ExtractTextPlugin("[name].css")],
    entry: {
    //...省略其
```

+ 使用CDN远程文件

```
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
```

+ [html-webpack-plugin](https://www.npmjs.com/package/html-webpack-plugin)

+ [react-hot-loader](https://github.com/gaearon/react-hot-loader) 

+ [webpack-dev-server](http://webpack.github.io/docs/webpack-dev-server.html) 'open-browser-webpack-plugin'

    little node.js express server
    - `webpack-dev-server`
    - `webpack-dev-server --content-base [path]`
    - `webpack-dev-server --inline --hot`

## [Code splitting](http://webpack.github.io/docs/code-splitting.html)

+ [bundle-loader](https://www.npmjs.com/package/bundle-loader)

## [Shim modules](http://webpack.github.io/docs/shimming-modules.html)

处理jquery这种非module的库

+ imports-loader

```
//file.js 依赖全局变量$
require("imports?$=jquery!./file.js")
```

+ ProvidePlugin

```
//把module转换为variable,全局可用，不用写require('jquery')
new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery"
})
```

+ exports-loader

暴露文件的变量

```
//设置 window.XModule=...
require("imports?window=>{}!exports?window.XModule!./file.js")
```

+ expose-loader

```
//暴露file.js为XModule到全局中
require("expose?XModule!./file.js")
```

## [externals](http://webpack.github.io/docs/library-and-externals.html)

使用的模块作为全局变量，从外部引用，不会被webpack处理，代码不出现在bundle中

```
//data.js
var data = 'Hello World';


//webpack.config.js
module.exports = {
  entry: './main.jsx',
  output: {
    filename: 'bundle.js'
  },
  module: {
    loaders:[
      {
        test: /\.js[x]?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      },
    ]
  },
  externals: {
    // require('data') is external and available
    //  on the global var data
    'data': 'data'
  }
};


// main.jsx
var data = require('data');
var React = require('react');
var ReactDOM = require('react-dom');

ReactDOM.render(
  <h1>{data}</h1>,
  document.body
);
```




## Hot Module Replacement([HMR](https://webpack.github.io/docs/hot-module-replacement-with-webpack.html))

+ 两种方式启用：

    1. `webpack-dev-server --hot --inline`

    2. 修改webpack.config.js
    ```
    entry: [
        'webpack/hot/dev-server',
        'webpack-dev-server/client?http://localhost:8080',
        ...
    ],
    ...
    plugins: [
        new webpack.HotModuleReplacementPlugin()
    ]
    ```
    然后运行`webpack-dev-server`

+ open-browser-webpack-plugin会影响hot module replacement
+ 要设置publicPath,否则自动刷新后内容不变

# Ref

+ [official](http://webpack.github.io/docs/configuration.html)

+ [Webpack 入门指迷](https://segmentfault.com/a/1190000002551952)

+ [webpack 入门指南](http://www.cnblogs.com/vajoy/p/4650467.html)