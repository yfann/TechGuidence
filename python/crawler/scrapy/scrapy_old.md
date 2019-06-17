#Scrapy

## install

## [cmd](http://scrapy-chs.readthedocs.io/zh_CN/latest/topics/commands.html#topics-commands-ref)

+ `scrapy startproject [name]` //创建项目

+ `scrapy list`

+ `scrapy crawl [name] [-o output.json] -a param=value` //开启爬虫,output.json爬出的item

    `scrapy crawl Test --logfile=test.log -o test.json -t json`

+ `scrapy shell [url]`
+ `scrapy fetch --nolog [url]`
+ `scrapy view [url]`
+ `scrapy parse [url]`

## start
1. create scrapy project
2. define Item(Data structure)
3. code spider to populate Item
4. code Item Pipeline to save Item


## [spider](http://scrapy-chs.readthedocs.io/zh_CN/latest/topics/spiders.html)

+ start_requests()
产生第一个Request,启动爬虫未指定url时会被调用，只调用一次，用start_urls生成Request.
指定了url时make_requests_from_url()被用来创建Request.

```py
#默认方法
def start_requests(self):
    return [scrapy.FormRequest("http://www.example.com/login",
                               formdata={'user': 'john', 'pass': 'secret'},
                               callback=self.logged_in)]

def logged_in(self, response):
    # here you would extract links to follow and return Requests for
    # each of them, with another callback
    pass
```

+ make_requests_from_url(url)

转化url到request,初始化request时被start_requests()调用

+ log(msg)

+ parse(response)

处理下载的response的回调方法，返回新的request或Item

```py
import scrapy
from myproject.items import MyItem

class MySpider(scrapy.Spider):
    name = 'example.com'
    allowed_domains = ['example.com']
    start_urls = [
        'http://www.example.com/1.html',
        'http://www.example.com/2.html',
        'http://www.example.com/3.html',
    ]

    def parse(self, response):
        sel = scrapy.Selector(response)
        for h3 in response.xpath('//h3').extract():
            yield MyItem(title=h3)

        for url in response.xpath('//a/@href').extract():
            yield scrapy.Request(url, callback=self.parse)
```
## CrawlSpider

+ scrapy.contrib.spiders.Rule(link_extractor, callback=None, cb_kwargs=None, follow=None, process_links=None, process_request=None)

  - [link_extractor](http://scrapy-chs.readthedocs.io/zh_CN/latest/topics/link-extractors.html#topics-link-extractors)
  - callback(link_extractor获取链接时的回调,避免用parse作为回调)

+ parse_start_url(response)

start_url请求返回时被调用，此方法返回Item或Request或both

+ example

```py
import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors import LinkExtractor

class MySpider(CrawlSpider):
    name = 'example.com'
    allowed_domains = ['example.com']
    start_urls = ['http://www.example.com']

    rules = (
        # 提取匹配 'category.php' (但不匹配 'subsection.php') 的链接并跟进链接(没有callback意味着follow默认为True)
        Rule(LinkExtractor(allow=('category\.php', ), deny=('subsection\.php', ))),

        # 提取匹配 'item.php' 的链接并使用spider的parse_item方法进行分析
        Rule(LinkExtractor(allow=('item\.php', )), callback='parse_item'),
    )

    def parse_item(self, response):
        self.log('Hi, this is an item page! %s' % response.url)

        item = scrapy.Item()
        item['id'] = response.xpath('//td[@id="item_id"]/text()').re(r'ID: (\d+)')
        item['name'] = response.xpath('//td[@id="item_name"]/text()').extract()
        item['description'] = response.xpath('//td[@id="item_description"]/text()').extract()
        return item

```


## Ref

+ [scrapy](http://scrapy-chs.readthedocs.io/zh_CN/latest/topics/shell.html)