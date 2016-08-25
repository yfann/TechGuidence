# Pyspider


## install

+ `pip install lxml-3.4.4-cp27-none-win32.whl`   download [lxml](https://pypi.python.org/pypi/lxml/3.4.4)

+ `pip install pyspider`

+ 下载phantomjs,配置bin到环境变量

## Cmd
+ `pyspider all`运行pyspider并启动它的所有组件 [http://localhost:5000](http://localhost:5000) 


##　Detail

+ fetch_type='js' 

```py
# 执行js渲染页面，需要phantomjs
 self.crawl(each.attr.href, callback=self.detail_page,validate_cert=False,fetch_type='js')
```

+ request会放入队列中，自动去重重试

## Trouble shooting

+ issue: ssl certificate problem unable to get local issuer certificate

```py

# 添加 validate_cert=False

...
self.crawl(each.attr.href, callback=self.detail_page,validate_cert=False)
```


## Ref

+ [offical](http://docs.pyspider.org/en/latest/)

+ [pyspider 案例](http://cuiqingcai.com/2652.html)

