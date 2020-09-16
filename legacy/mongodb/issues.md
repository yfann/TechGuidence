+ shell 日期查询

> mongodb中日期存的是ISODate,映射为java.util.Date类型，比本地时间早8小时  
>当在shell中查询大于2018-01-01时  
>直接用ISODate查询  
>`find({ "post_date" : { "$gte" : ISODate("2018-01-01T00:00:000Z"))}})`  
>或用new Date,month-1,hour+8  
>`find({ "post_date" : { "$gte" : new Date(2018,0,1,8,0,0)}})`

