
Express框架建立在node.js内置的http模块上.

##创建项目

用express命令创建

1. 安装nodejs
2. 安装express,  cmd:npm install -g express-generator
3. 创建一个express项目,   cmd:express MyExpressApp
4. 安装项目的依赖项,   cmd:cd MyExpressApp,cmd:npm install
5. 开启项目,  cmd:npm start, 查看http://localhost:3000

手动创建项目

1. 创建文件夹
2. 创建package.json文件

        {
            "name": "demo",
            "description": "My First Express App",
            "version": "0.0.1",
            "dependencies": {
                "express": "3.x"
            }
        }
        
3. 创建app.js

        //加载express模块
        var express = require('express');
        var app = express();

        // 设定port变量，意为访问端口
        app.set('port', process.env.PORT || 3000);

        // 设定views变量，意为视图存放的目录
        app.set('views', path.join(__dirname, 'views'));

        // 设定view engine变量，意为网页模板引擎
        app.set('view engine', 'jade');

        app.use(express.favicon());
        app.use(express.logger('dev'));
        app.use(express.bodyParser());
        app.use(express.methodOverride());
        app.use(app.router);

        // 设定静态文件目录，比如本地文件
        // 目录为demo/public/images，访问
        // 网址则显示为http://localhost:3000/images
        app.use(express.static(path.join(__dirname, 'public')));
        //监听端口
        app.listen(app.get('port'));
        
4. 启动应用

        node app.js

##概念

###搭建服务器
		
nodejs创建服务器

        var express = require('express');
        var app = express();

        app.get('/', function (req, res) {
            res.send('Hello world!');
        });

        app.listen(3000);
        
express创建服务器

        var http = require("http");

        var app = http.createServer(function (request, response) {
            response.writeHead(200, { "Content-Type": "text/plain" });
            response.end("Hello world!");
        });

        app.listen(3000, "localhost");
        
express搭建HTTPS服务器

        var fs = require('fs');
        var options = {
            key: fs.readFileSync('E:/ssl/myserver.key'),
            cert: fs.readFileSync('E:/ssl/myserver.crt'),
            passphrase: '1234'
        };

        var https = require('https');
        var express = require('express');
        var app = express();

        app.get('/', function (req, res) {
            res.send('Hello World Expressjs');
        });

        var server = https.createServer(options, app);
        server.listen(8084);
        console.log('Server is running on port 8084');


###中间件

每个中间件对request对象加工,调用next可以把request对象传到下一个中间件

        function uselessMiddleware(req, res, next) {
            next();
        }

use方法可以注册中间件

        app.use("/home", function (request, response, next) {
            response.writeHead(200, { "Content-Type": "text/plain" });
            response.end("Welcome to the homepage!\n");
        });

        app.use("/about", function (request, response, next) {
            response.writeHead(200, { "Content-Type": "text/plain" });
            response.end("Welcome to the about page!\n");
        });

        app.use(function (request, response) {
            response.writeHead(404, { "Content-Type": "text/plain" });
            response.end("404 error!\n");
        });


###http动词

        //all可以匹配所有动作，"*" 匹配所有路径
        app.all("*", function (request, response, next) {
            response.writeHead(200, { "Content-Type": "text/plain" });
            next();
        });

        //匹配根路径的get请求
        app.get("/", function (request, response) {
            response.end("Welcome to the homepage!");
        });

        //可以获取参数 ？表示可选
        app.get('/hello/:who?', function (req, res) {
            if (req.params.id) {
                res.end("Hello, " + req.params.who + ".");
            }
            else {
                res.send("Hello, Guest.");
            }
        });

        //正则匹配路径
        app.get(/^\/commits\/(\w+)(?:\.\.(\w+))?$/, function (req, res) {
            var from = req.params[0];
            var to = req.params[1] || 'HEAD';
            res.send('commit range ' + from + '..' + to);
        });
     
###response

        //重定向
        response.redirect("/hello/anime");
        //发文件
        response.sendFile("/path/to/anime.mp4");
        //渲染网页
        response.render("index", { message: "Hello World" });

       
        
        //返回结果
        app.get('/', function (req, res) {
            res.send('Hello World');
        });
        //设置响应头的写法
        app.get('/', function (req, res) {
            var body = 'Hello World';
            res.setHeader('Content-Type', 'text/plain');
            res.setHeader('Content-Length', body.length);
            res.end(body);
        });
        
###request

+ request.ip
+ request.files

###构建模块

        // routes/api.js

        exports.index = function (req, res) {
            res.json(200, { name: "张三", age: 40 });
        }

        // app.js

        var api = require('./routes/api');
        app.get('/api', api.index);
  
###网页模板

静态模板

        //app.js片段
        app.get('/index', function (req, res) {
            res.sendfile('./views/index.html');
        });
        
        
        //指定静态文件目录
        app.use(express.static('public'));
        //服务器端就到public/bootstrap/css/目录中寻找bootstrap.css文件
        <link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
        
动态模板

1. 安装模板引擎

选用Handlebars， cmd:npm install hbs --save-dev(save-dev将依赖关系写入package.json)

2. 新建views/index.html

        <!-- views/index.html文件 -->

        <h1>文章列表</h1>
 
        {{#each entries}}
        <p>
           <a href="/article/{{id}}">{{title}}</a><br/>
            Published: {{published}}
        </p>
        {{/each}}

3. 修改app.js

        // app.js文件

        var express = require('express');
        var app = express();

        // 加载hbs模块
        var hbs = require('hbs');

        // 指定模板文件的后缀名为html
        app.set('view engine', 'html');

        // 运行hbs模块
        app.engine('html', hbs.__express);
        //把子目录views下面的index.html文件，交给模板引擎hbs渲染
        app.get('/index', function (req, res) {
            res.render('index',{title:"最近文章", entries:[...]);
        });
		
###Express.Router

        var router = express.Router();
        //实际路径为/app
        router.get('/', function (req, res) {
            res.send('首页');
        });
        //实际路径为/app/about
        router.get('/about', function (req, res) {
            res.send('关于');
        });
        //
        app.use('/app', router);
        
        //
        var router = express.Router();
        router.route('/api')
            .post(function (req, res) {
                // ...
            })
            .get(function (req, res) {
                Bear.find(function (err, bears) {
                    if (err) res.send(err);
                    res.json(bears);
                });
            });
        app.use('/', router);
        
        //
        router.use(function (req, res, next) {
            console.log(req.method, req.url);
            next();
        });   
        
        //
        router.param('name', function (req, res, next, name) {
            // 对name进行验证或其他处理……
            console.log(name);
            req.name = name;
            next();
        });

        router.get('/hello/:name', function (req, res) {
            res.send('hello ' + req.name + '!');
        });
        
        
        //
        app.route('/login')
        .get(function (req, res) {
            res.send('this is the login form');
        })
        .post(function (req, res) {
            console.log('processing');
            res.send('processing the login form!');
        });      

###上传文件

安装multer模块

###others

       //设置变量
       app.set("views", __dirname + "/views");
       //脚本所在路径      
       __dirname  
       //cmd的执行路径
       .   


[API](http://expressjs.com/en/api.html)
[reference](http://javascript.ruanyifeng.com/nodejs/express.html)      