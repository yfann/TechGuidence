# Anuglar


## 概念

+ module [#](https://docs.angularjs.org/api/ng/type/angular.Module)
   
    angular.module('example',[])
    
+ controller

    在不需要的时候实例会被销毁

    angular.module('example').controller('exampleCtrl',[]) //controller 在特定的module上
    
    ng-controller="exampleCtrl as examp"  //实例化exampleCtrl并保存到变量examp
    
+ directive

    angular.module('example').directive('exDir',function(){
        return {
            restrict:'A',
            link:function(scope,element,attr){
                element.on('change', function () {
					scope.$apply(function () {
						scope.$eval(attr.exDir); //$eval可以执行angular语句
					});
				});
            };
        };
    })
    
+ service
   
    单例对象，只有在应用生命周期结束时(关闭浏览器)才被清除.
   
    angualr.module('example').service('exService',['$q',ExService])
    
    function ExService($q){}

    内置的service
    - $injector //$injector.get('someservice')
    - $q
    - $window
    - &resource
    
    创建的三种方式[#](http://www.oschina.net/translate/angularjs-factory-vs-service-vs-provider)：
    - factory()  //创建对象，添加属性，返回对象
    - service()  //通过new创建对象，给this添加属性
    - provider()  //可以传入.config()的service,service启动前可以进行模块配置

+ 内置方法

    - angular.fromJson/angular.toJson

## $provide

+ provider, value, constant, service, factory 都是provider.
+ provider通过$get来注入单例.
+ decorator可以修饰已有的provider
+ value 可以被修改,不能注入到config
+ constant 不能被修改，可以被注入到config


        //定义一个porvider
        $provider.provider('age',{
            start:10,
            $get:function(){
                return this.start+2;
            }
        });
        $provider.provider('age',function($filterProvider){
            this.start=10;
            this.$get=function(){
                return this.start+2;
            };
        });
        //调用
        app.controller('MainCtrl',function($scope.age){
            $scope.age=age;
        });


        //provide
        $provide.provider('myDate', {
            $get: function() {
                return new Date();
            }
        });
        //factory
        $provide.factory('myDate', function(){
            return new Date();
        });
        //service
        $provide.service('myDate', Date);

        //value 可以被修改, constant 不能修改 ($get只返回常量)
        $provide.value('pageCount', 7);
        $provide.constant('pageCount', 7);
        

        //decorator可以修饰已有的provider
        $provide.decorator('pageCount', function($delegate) {
            return $delegate + 1;
        });


## $injector

## directive

+ scope设值
    - false：儿子继承父亲的值，改变父亲的值，儿子的值也随着改变，反之亦然，这就是继承且不隔离
    - true：儿子继承父亲的值，改变父亲的值，儿子的值也随着改变，但是改变儿子的值，父亲的值并没有改变，这就是继承但是隔离
    - {}：没有继承父亲的值，所以儿子的值为空，改变任何一方的值都不会影响另一方，这就是不继承且隔离
        + {}中@，单向绑定
        + {}中=，双向绑定
        + {}中&，调用父作用域中的函数
            ```js
            scope:{
                start:'&'
            }
            ```
+ directive中的controller：主要对外提供交互接口，可以用来与不同指令间通信
+ compile和link互斥，如果配置了compile则compile返回的函数作为link,忽略原有的link函数
+ compile:指令和实时数据被放到DOM之前进行DOM操作
+ link函数:负责将作用域与DOM进行链接

## ng-form

+ 可以嵌套
+ 需要设置form name和控件name,控件要绑定变量
+ form会对应FormController实例，其中控件会对应NgModelController实例
+ 控件上的样式：ng-valid，ng-invalid, ng-pristine(没动过), ng-dirty(动过)
+ form属性
    - $pristine 表单是否未被动过
    - $dirty 表单是否被动过
    - $valid 表单是否验证通过
    - $invalid 表单是否验证失败
    - $error 表单的验证错误

## tips

+ ng-model-options 
    *双向绑定使用了ng-model-options时,UI会根据特定条件同步到model,UI的值和model的值会存在不一致的时刻*
+ $rollbackViewValue() 
    *model中的值同步到UI*
+ module.config()
    *可以传入provider,constant,实例化之前配置*
+ lazyload时会自动引入modul





## ref
- angular
    + [angular中文社区](http://angularjs.cn/tag/AngularJS)
    + [angular学习笔记](http://www.cnblogs.com/liulangmao/tag/angular/default.html?page=4)
    + [AngularJS学习笔记](https://www.zouyesheng.com/angular.html)
    + [angular 1.x doc](http://devdocs.io/angularjs~1.5/api/ng/function/angular.foreach)
    + [official angular](https://code.angularjs.org/1.3.20/docs/api/ng/service/$document)

- angular feature
    + [compile link](http://www.cnblogs.com/liulangmao/p/3980256.html) 
    + [scope](http://www.cnblogs.com/liulangmao/p/3990720.html)
    + [angular的五种服务](http://www.cnblogs.com/liulangmao/p/4078246.html)
    + [表单验证](http://www.cnblogs.com/liulangmao/p/4118868.html)
    + [ngModelController](http://www.cnblogs.com/liulangmao/p/4110137.html)
    + [$resource](https://docs.angularjs.org/api/ngResource/service/$resource)
    + [依赖注入](http://www.html-js.com/article/Understand-the-dependency-injection-in-AngularJS-with-Angular-development-web-application)
    + [Angular directive 实例详解](https://segmentfault.com/a/1190000005851663)
    + [directive require](https://my.oschina.net/u/2342955/blog/411508)

## plugin
+ [oclazyload](https://oclazyload.readme.io/docs)
+ [uiRouter](https://github.com/angular-ui/ui-router/wiki) 
    + [#](http://bubkoo.com/2014/01/01/angular/ui-router/guide/state-manager/)
    + [#](https://ui-router.github.io/)
    + [Quick Reference](https://github.com/angular-ui/ui-router/wiki/Quick-Reference)
    + [api](https://ui-router.github.io/ng1/docs/0.3.1/index.html#/api)
+ [ui-select](http://angular-ui.github.io/ui-select/#top)
    + [wiki](https://github.com/angular-ui/ui-select/wiki)
+ [ui-grid](http://ui-grid.info/)  
    + [#1](https://www.cnblogs.com/freeliver54/p/6868752.html) 
    + [#2](https://blog.csdn.net/Inuyasha1121/article/details/55187415)
+ [ui.bootstrap](http://angular-ui.github.io/bootstrap/)

## UI
+ [angular UI](https://github.com/angular-ui)
+ [angular UI](https://angular-ui.github.io/)
+ [10 Best AngularJS Frameworks](https://codegeekz.com/10-best-angularjs-frameworks/)
+ [angular UI bootstrap](https://www.npmjs.com/package/angular-ui-bootstrap)

## demos
+ [ng-admin](https://github.com/marmelab/ng-admin)
+ [angularjs+bootstrap](https://www.cnblogs.com/fenghun/articles/5522964.html)
+ [Minovate](https://themeforest.net/item/minovate-angular-admin-dashboard/10068009)
+ [angulr](http://www.bootstrapstage.com/angulr-bootstrap-admin-web-app-with-angularjs/)
+ [BlurAdmin](https://akveo.github.io/blur-admin/)
+ [16个良好的 Bootstrap Angularjs 管理后台主题](https://www.cnblogs.com/yujinbin/p/5200762.html)