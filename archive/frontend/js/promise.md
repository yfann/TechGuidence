#Promises

##Concept

- 解决javascript中的异步回调地狱:

  + Deferreds  //定义工作单元,定义工作
  + Promises  //从Deferreds返回的数据

- Promise的三种状态:

  + unfulfilled 未完成
  + resolved 已完成
  + rejected 拒绝

- 方法：

  + promise.then(resolvedHandler,rejectedHandler) //对应resolve和reject的回调函数,返回promise对象，可以多次调用，
  resolve或reject之后调用时会立即执行回调参数
  + promise.when() //等待多个promise
  + defer.resolve()/defer.reject() //异步操作,调用then添加的方法，只执行一次

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
 
##实现

        //包装成promise
        //then(func1).then(func2)  func2的输入是fun1的输出
        var ref = function (value) {
            //判断是否为promise对象,是promise则不处理
            if (value && typeof value.then === "function")
                return value;
            return {
                then: function (callback) {
                    return ref(callback(value));//延迟value的传递
                }
            };
        };

        var reject = function (reason) {
            return {
                then: function (callback, errback) {
                    return ref(errback(reason));
                }
            };
        };
        


        var defer = function () {
            var pending = [], value;
            return {
                resolve: function (_value) {
                    if (pending) {
                        value = ref(_value);
                        for (var i = 0, ii = pending.length; i < ii; i++) {
                            value.then.apply(value, pending[i]);
                        }
                        pending = undefined;
                    }
                },
                promise: {
                    then: function (_callback, _errback) {
                        var result = defer();
                        // provide default callbacks and errbacks
                        _callback = _callback || function (value) {
                            // by default, forward fulfillment
                            return value;
                        };
                        _errback = _errback || function (reason) {
                            // by default, forward rejection
                            return reject(reason);
                        };
                        var callback = function (value) {
                            result.resolve(_callback(value));
                        };
                        var errback = function (reason) {
                            result.resolve(_errback(reason));
                        };
                        if (pending) {
                            pending.push([callback, errback]);
                        } else {
                            value.then(callback, errback);
                        }
                        return result.promise;
                    }
                }
            };
        };

        //异步模式
        
        //异步
        var enqueue = function (callback) {
            //process.nextTick(callback); // NodeJS
            setTimeout(callback, 1); // Naïve browser solution
        };
        
        var ref = function (value) {
            // ...
            return {
                then: function (callback) {
                    var result = defer();
                    // XXX
                    enqueue(function () {
                        result.resolve(callback(value));
                    });
                    return result.promise;
                }
            };
        };
        
        var reject = function (reason) {
            return {
                then: function (callback, errback) {
                    var result = defer();
                    // XXX
                    enqueue(function () {
                        result.resolve(errback(reason));
                    });
                    return result.promise;
                }
            };
        };
        
        var defer = function () {
            var pending = [], value;
            return {
                resolve: function (_value) {
                    // ...
                            enqueue(function () {
                                value.then.apply(value, pending[i]);
                            });
                    // ...
                },
                promise: {
                    then: function (_callback, _errback) {
                            // ...
                            enqueue(function () {
                                value.then(callback, errback);
                            });
                            // ...
                    }
                }
            };
        };

##[Ref]

+ [深入理解Promise实现细节](https://segmentfault.com/a/1190000002591145)  
+ [deferred](http://www.ruanyifeng.com/blog/2011/08/a_detailed_explanation_of_jquery_deferred_object.html)   