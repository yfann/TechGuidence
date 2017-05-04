## setup
+ install python3
+ `pip3 install scrapy` need [visual c++]
+ `pip3 install pypiwin32`
+ `pip3 install pymongo`

## start project
+ `scrapy startproject <project name>`
+ `scrapy genspider <spidername> <url>` *新建爬虫*
+ `settings.py` update `ROBOTSTXT_OBEY = False` *是否遵循爬虫规则*
+ `settings.py` add `DEFAULT_REQUEST_HEADERS` `user-agent` *伪装浏览器*

## cmd
+ `scrapy startproject <project name>`
+ `scrapy crawl <spider name> [-o <output.json>] [-a <paramName>=<param>]`  *-a 传参 self.paramName*
+ `scrapy runspider <spider.py> [-o <output.json>]`
+ `scrapy shell "<url>"` *test for extracting data*

## method

+ `start_requests()` *return an iterable of Requests*
+ `start_urls` *url array, instead of start_requets() and parse() will be called for each request*
+ `parse()` *处理请求的回调和发送新请求*

## 原理
+ 发送请求和处理请求是异步处理的
+ 自动过滤重复请求`DUPEFILTER_CLASS`
+ yield request ??
+ yield item ??
+ `scrapy.cfg`所在的目录为根目录

## 存储
+ json file *append后就不能用了*
+ json line *可以不断append新内容*

## Ref
+ [scrapy](https://scrapy.org/)
+ [scrapy and mongodb](https://realpython.com/blog/python/web-scraping-with-scrapy-and-mongodb/)
+ [depends](https://doc.scrapy.org/en/latest/intro/install.html)
+ [commands](https://docs.scrapy.org/en/latest/topics/commands.html#topics-commands-ref)