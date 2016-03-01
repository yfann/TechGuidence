#javascript内存优化

##使用函数块，尽量少定义全局变量

局部变量会在执行完后释放，全局变量会活到页面关闭

	;(function(win, doc, $, undefined) {
	  // 主業務代碼
	})(window, document, jQuery);

##不需要的变量置null

解除变量引用

	var data = { /* some big data */ };
	// blah blah blah
	data = null;



[js内存优化](http://lifemap.in/javascript-memory-optimize/)