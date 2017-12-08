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



## $resource[#](https://docs.angularjs.org/api/ngResource/service/$resource)

### 引用
引入angular-resource.js文件
angular.module('app',['ngResource']);

### API 
$resource(url, [paramDefaults], [actions], options);

    url  // /api/entries/:id
    paramDefaults //



 