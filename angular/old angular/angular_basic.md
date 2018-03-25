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

## tips

+ ng-model-options 
    *双向绑定使用了ng-model-options时,UI会根据特定条件同步到model,UI的值和model的值会存在不一致的时刻*
+ $rollbackViewValue() 
    *model中的值同步到UI*
+ module.config()
    *可以传入provider,constant,实例化之前配置*
+ lazyload时会自动引入modul

## ref
+ [angular中文社区](http://angularjs.cn/tag/AngularJS)
+ [angular学习笔记](http://www.cnblogs.com/liulangmao/tag/angular/default.html?page=4)
+ [AngularJS学习笔记](https://www.zouyesheng.com/angular.html)
+ [angular 1.x doc](http://devdocs.io/angularjs~1.5/api/ng/function/angular.foreach)
+ [official angular](https://code.angularjs.org/1.3.20/docs/api/ng/service/$document)
+ [compile link](http://www.cnblogs.com/liulangmao/p/3980256.html) 
+ [scope](http://www.cnblogs.com/liulangmao/p/3990720.html)
+ [angular的五种服务](http://www.cnblogs.com/liulangmao/p/4078246.html)
+ [表单验证](http://www.cnblogs.com/liulangmao/p/4118868.html)
+ [ngModelController](http://www.cnblogs.com/liulangmao/p/4110137.html)
+ [$resource](https://docs.angularjs.org/api/ngResource/service/$resource)
+ [依赖注入](http://www.html-js.com/article/Understand-the-dependency-injection-in-AngularJS-with-Angular-development-web-application)

## plugin
+ [oclazyload](https://oclazyload.readme.io/docs)
+ [uiRouter](http://bubkoo.com/2014/01/01/angular/ui-router/guide/state-manager/)

## UI
+ [angular UI](https://github.com/angular-ui)
+ [10 Best AngularJS Frameworks](https://codegeekz.com/10-best-angularjs-frameworks/)
+ [angular UI bootstrap](https://www.npmjs.com/package/angular-ui-bootstrap)

## grid

+ [ui-grid](http://ui-grid.info/)

## demos
+ [ng-admin](https://github.com/marmelab/ng-admin)
+ [angularjs+bootstrap](https://www.cnblogs.com/fenghun/articles/5522964.html)
+ [Minovate](https://themeforest.net/item/minovate-angular-admin-dashboard/10068009)
+ [angulr](http://www.bootstrapstage.com/angulr-bootstrap-admin-web-app-with-angularjs/)
+ [BlurAdmin](https://akveo.github.io/blur-admin/)
+ [16个良好的 Bootstrap Angularjs 管理后台主题](https://www.cnblogs.com/yujinbin/p/5200762.html)