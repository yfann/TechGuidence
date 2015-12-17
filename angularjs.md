#Anuglar


##创建一个angular程序

+ module
   
    angular.module('example',[])
    
+ controller

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

    angualr.module('example').service('exService',['$q',ExService])
    
    function ExService($q){}

    //内在的service
    - $injector //$injector.get('someservice')
    - $q
    - $window
    - &resource
    

+ 内置方法

    - angular.fromJson/angular.toJson
    - 
    
 
 