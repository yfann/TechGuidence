#Promises

##Concept

- 解决javascript中的异步回调地狱:

  + Deferreds  //定义工作单元,定义工作
  + Promises  //从Deferreds返回的数据

- Promise的三种状态:

  + unfulfilled 未完成
  + resolved 已完成
  + rejected 拒绝

- promise的方法：

  + then(resolvedHandler,rejectedHandler) //对应resolve和reject的回调函数,返回promise对象
  + when() //等待多个promise
  + promise.resolve()/promise.reject() //异步操作

- Code

    传统回调模式：

        doMission1(doMission2); //doMission1有控制权
        
        function doMission1(callback){
            var value = 1;
            callback(value);
        }
        
    Promise模式:

        doMission1().then(doMission2); // doMission1()交出了控制权,返回一个promise
  
        function doMission1(){
            return {
                then: function(callback){
                    var value = 1;
                    callback(value);
                }
            };
        }   
 


##[Ref]

+ [深入理解Promise实现细节](https://segmentfault.com/a/1190000002591145)     