##移动框架

###分类

+ native app

    用户体验好(速度快，UI漂亮)

+ web app

    基于小屏幕，触控操作特点开发web页面,引用轻量级库,UI应该像nativeUI([digg](digg.com),[sun](http://pattern.dk/sun/))

+ hybrid app

    多view混合，单view混合，web主题
    开发部署快，访问native api(电商)
    
    - 使用框架PhoneGap,AppCan
    - 先原生，后开发web view
    - 其他语言到原生,Titanium,xamarin,react native
    
###框架

+ PhoneGap/cordova(Hybrid)
   
   HTML页面构建App,依赖web view,底层库，无UI层(可以用ionic)
   
+ Appcelerator Titanium(Native)[#](http://www.appcelerator.com/blog/2012/05/comparing-titanium-and-phonegap/)

   NodeJS驱动编译Native层代码,js来开发native

+ jQueryMobile(UI 库)

   html驱动,更像web UI

+ Sencha touch(UI 库)

   Ext JS项目与触摸屏代码库项目jQTouch和SVG处理库Raphael合并，开发web app,更像原生UI,js驱动无html?
   
+ ionic(Hybrid)
   
   基于cordova和angularjs,带UI的cordova
   
+ xamarin(Native)

   基于Mono,c#开发native

+ react Native(Native)

   js,react开发Native

+ jQT

+ App Framework

+ Kendo UI

+ famo

+ AppCan

+ Adobe Air

+ RubyMotion

+ mui


##库

+ LESS/SASS[#](http://www.ruanyifeng.com/blog/2012/06/sass.html)

+ Unobtrusive JavaScript[#1](http://icant.co.uk/articles/seven-rules-of-unobtrusive-javascript/)[#2](http://kb.cnblogs.com/page/80652/)[#3](http://www.iteye.com/news/3754)

+ polyfill[#](http://www.codeproject.com/Articles/369858/Writing-polyfills-in-JavaScript)

     填补不支持CSS3,HTML5的空白

+ Modernizr
  
     检查是否支持css3,html5

+ YepNope.js

     是一个超高速的按条件异步加载资源的加载器，允许你只加载使用到的资源（css及js）


+ Minify

    是使用 PHP5 开发的用于合并压缩 js/css 文件的应用程序

+ Sizzle

    Sizzle原来是jQuery里面的选择器引擎


+ OWASP

    Open Web Application Security Project

+ Jquery移动端的替代者

     zepto,jq2

+ MVC

  angularjs,reactjs



---



##cordova(Visual Studio下的mobile开发)

###目录结构

+ www
+ merges

编译特定平台时，会把merges下的文件替换www中的同名文件，也会添加文件

###包管理

+ bower[#](http://bower.io/)

   安装命令：
   >npm install -g bower

   安装包:

   >bower install angular

   查看当前项目安装的包：
   >bower list

   查看包版本
   >bower list angular

   重要的文件bower.json(visual studio会自动安装依赖项)，.bowerrc(更改下载包的位置)

   基于bower的工具(YeoMan,Grunt)

+ npm
+ nuget


###hooks[#](http://cordova.apache.org/docs/en/dev/guide/appdev/hooks/index.html)

###ionic(UI库)[#](http://taco.visualstudio.com/en-us/docs/tutorial-ionic/)

1. 安装ionic CLI
  >npm install -g ionic

2. 用ionic创建项目模板
  >ionic start ionicMySideMenu sidemenu

3. vs 用 project from existing code 加载ionic项目，bower会自动安装依赖项

4. 添加android platform(build solution 也可以添加)
   >ionic platform add android


###plugin[#](http://cordova.apache.org/docs/en/4.0.0/guide/hybrid/plugins/index.html#Plugin%20Development%20Guide)

当需要访问手机的原生功能或多个app可以共用的组件时，需要创建插件

Build your first Cordova plugin[#](http://taco.visualstudio.com/en-us/docs/createplugintutorial/)

###debug in VS

+ Apache Ripple simulator 

  主要调试界面, cross domain proxy(local/remote)
  
+ VS Emulator for Android[#](http://taco.visualstudio.com/en-us/docs/run-app-apache/)

  Android Virtual Device (AVD)[#](http://developer.android.com/tools/devices/managing-avds.html)

  Genymotion emulator

+ 调试IOS[#](http://taco.visualstudio.com/en-us/docs/run-app-ios/)

  iOS Simulator/iOS device[#](http://taco.visualstudio.com/en-us/docs/run-app-ios/#iOSDevice) 需要安装remote agent[#](http://taco.visualstudio.com/en-us/docs/install-vs-tools-apache-cordova/#ios)(安装在Mac电脑,在Mac端打开emulator)
  
  MacInCloud[#](http://www.macincloud.com/)


###Build[#](http://taco.visualstudio.com/en-us/docs/deploy-and-run-app/)

Cordova Command Line Interface 使用 plugman管理插件

VS中使用vs-tac(CLI pre-processor,npm package) 管理其他CLI,可以注入hooks(实现CLI没有的功能)

remotebuild agent for iOS[#](http://taco.visualstudio.com/en-us/docs/install-vs-tools-apache-cordova/#ios)