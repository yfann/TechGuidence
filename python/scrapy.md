#Scrapy

## install

## cmd

+ `scrapy startproject [name]` //创建项目

+ `scrapy crawl [name] [-o output.json]` //开启爬虫,output.json爬出的item

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


## Ref

+ [scrapy](http://scrapy-chs.readthedocs.io/zh_CN/latest/topics/shell.html)