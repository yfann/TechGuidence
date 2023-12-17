

#函数式编程

纯函数，输入对应着输出，不影响外部环境，不被外部环境影响

+ Cacheable

		var squareNumber  = memoize(function(x){ return x*x; });
		
		squareNumber(4);
		//=> 16
		
		squareNumber(4); // 从缓存中读取输入值为 4 的结果
		//=> 16
		
		squareNumber(5);
		//=> 25
		
		squareNumber(5); // 从缓存中读取输入值为 5 的结果
		//=> 25
		
		var memoize = function(f) {
		var cache = {};
		
		return function() {
			var arg_str = JSON.stringify(arguments);
			cache[arg_str] = cache[arg_str] || f.apply(f, arguments);
			return cache[arg_str];
		};
		};
		
+ Portable

		// 不纯的
		var signUp = function(attrs) {
		var user = saveUser(attrs);
		welcomeUser(user);
		};
		
		// 纯的
		var signUp = function(Db, Email, attrs) {
		return function() {
			var user = saveUser(Db, attrs);
			welcomeUser(Email, user);
		};
		};
		
+ Testable

  不需要mocking

+ 并行

##curry(参数缓存)

多个参数输入变为单个参数输入

		var add = function(x) {
            return function(y) {
                return x + y;
            };
		};
		
		var increment = add(1);
		var addTen = add(10);
		
		increment(2);
		// 3
		
		addTen(2);
		// 12



		var curry = require('lodash').curry;
		//要操作的参数放最后
		var match = curry(function(what, str) {
		    return str.match(what);
		});
        
		//调用
		var hasSpaces = match(/\s+/g);
		// function(x) { return x.match(/\s+/g) }
		hasSpaces("hello world");
		// [ ' ' ]
		hasSpaces("spaceless");
		
##compose(代码组合)  

+　顺序重要

        //f,g为函数，g先于f执行，数据流从右向左，返回新函数
        var compose = function(f,g) {
            return function(x) {
                return f(g(x));
            };
        };
　
+ 结合律

        var associative = compose(f, compose(g, h)) == compose(compose(f, g), h);

+ pointfree

        // 非 pointfree，因为提到了数据：word
        var snakeCase = function (word) {
          return word.toLowerCase().replace(/\s+/ig, '_');
        };

        // pointfree
        var snakeCase = compose(replace(/\s+/ig, '_'), toLowerCase);

##声明式

  指明做什么，而不是怎么做，不指定顺序，适合并行计算

        // 命令式
        var makes = [];
        for (i = 0; i < cars.length; i++) {
        makes.push(cars[i].make);
        }


        // 声明式
        var makes = cars.map(function(car){ return car.make; });


##Others

回调可以实现函数式!?

		//纯函数
		function receiveProducts(products) {
		  return {
		    type: types.RECEIVE_PRODUCTS,
		    products: products
		  }
		}

		shop.getProducts(products => {
			receiveProducts(products)
		})

		//不纯
		function receiveProducts() {
		  return {
		    type: types.RECEIVE_PRODUCTS,
		    products: api.products
		  }
		}


##Ref
+ [JS函数式编程指南](https://llh911001.gitbooks.io/mostly-adequate-guide-chinese/content/index.html)
+ [尾调用 尾递归](http://es6.ruanyifeng.com/#docs/function#%E5%87%BD%E6%95%B0%E7%BB%91%E5%AE%9A)