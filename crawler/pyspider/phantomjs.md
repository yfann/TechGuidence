

## install

+ [phantomjs](http://phantomjs.org/download.html),配置bin到环境变量

## API

+ phantom.exit

```js
//hello.js
console.log('Hello, world!');
phantom.exit();
```

```cmd
phantomjs hello.js
```

+ system.args

```cmd
phantomjs examples/arguments.js foo bar baz
```

```js
var system = require('system');
if (system.args.length === 1) {
    console.log('Try to pass some args when invoking this script!');
} else {
    system.args.forEach(function (arg, i) {
            console.log(i + ': ' + arg);
    });
}
```


## ref

+ [入门](http://www.tuicool.com/articles/beeMNj/)