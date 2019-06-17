## tips

+ xpath 使用`.` 确保在当前context中查询

```py
users = Selector(response).xpath('//div[@class="member-list"]/ul/li')
for user in users:
    item.head_url=user.xpath('.//div[@class="pic"]//img/@src')
```

+ 向callback传递参数

```py
def parse_page1(self, response):
    item = MyItem()
    item['main_url'] = response.url
    request = scrapy.Request("http://www.example.com/some_page.html",
                             callback=self.parse_page2)
    request.meta['item'] = item
    yield request

def parse_page2(self, response):
    item = response.meta['item']
    item['other_url'] = response.url
    yield item
```



## issues

+ 403 **setting.py中加USER_AGENT**

+ unicodedecodeerror: 'ascii' codec can't decode byte 0xb0 ...

[root cause](https://docs.python.org/3/howto/unicode.html)

solution:
```
import sys
reload(sys)
sys.setdefaultencoding('gbk')
```
+ No module named 'win32api'
pip install pypiwin32