+ shell 查日期

>使用shell脚本命令查询时不能使用“2016-07-08”这种格式的日期，应该使用
>db.interface_invoke_info.find({insertTime:{$gte:new Date(2016,05,27,8,0,0),$lt:new Date(2016,05,28,8,0,0)}}
>因为mongodb的日期格式和系统日期格式不一致，所在在查询的时候月份要-1，小时你输入几点就是查询的几点的，但是显示的数据却是在你查询的时间>上-8，例：
> db.interface_invoke_info.find({insertTime:{$gte:new Date(2016,05,27,8,44,0),$lt:new Date(2016,05,27,8,45,0)}})
>上述查询是2016-06-27 8:44:00——2016-06-27 8:45:00的数据，但是显示的日期格式是："insertTime" : ISODate>("2016-06-27T00:44:25.630Z")；