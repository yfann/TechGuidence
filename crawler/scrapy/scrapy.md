## setup
+ install python3
+ `pip3 install scrapy` need [visual c++]
+ `pip3 install pypiwin32`
+ `pip3 install pymongo`

## start project
+ `scrapy startproject <project name>`
+ `scrapy genspider <spidername> <url>`
+ `settings.py` update `ROBOTSTXT_OBEY = False`
+ `settings.py` add `DEFAULT_REQUEST_HEADERS` `user-agent`

## Ref
+ [scrapy](https://scrapy.org/)
+ [scrapy and mongodb](https://realpython.com/blog/python/web-scraping-with-scrapy-and-mongodb/)