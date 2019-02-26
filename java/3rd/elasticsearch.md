
## cmd
+ `bin\elasticsearch.bat`  运行
+ `curl http://localhost:9200/` 测试是否安装成功
+ `curl -X PUT localhost:9200/test` 新建`test` index(数据库)
+ `curl -X DELETE localhost:9200/test` 删除`test` index





## 查询语句

+ `GET _cat/indices`
+ `Get host/index/type/_search` 查询记录

## tips
+ 默认返回10条记录,需要设置`size`参数
+ 查询时curl可以在get时发送request body,postman可以用post查询

## kibana

+ Discover查询
    - `account_number:<100 AND balance:>47500`

## plugin

+ [analysis](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis.html) 默认分词器
+ [ik](https://github.com/medcl/elasticsearch-analysis-ik/) 中文分词插件
+ marvel
    - `elasticsearch-plugin`
+ [x-pack](https://www.elastic.co/guide/en/x-pack/current/installing-xpack.html)

## ref

+ [offical](https://www.elastic.co/cn/downloads/elasticsearch)
+ [offical start](https://www.elastic.co/start)
+ [Match Query](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/query-dsl-match-query.html)
+ [Elasticsearch: 权威指南](https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html)

+ [Windows 下安装 ElasticSearch & ElasticSearch head](https://www.jianshu.com/p/4467cfe4e651)
+ [ELASTIC SEARCH: HOW TO INSTALL MARVEL PLUGIN MANUALLY ON WINDOWS OS](https://hassantariqblog.wordpress.com/2016/09/19/elastic-search-how-to-install-marvel-plugin-manually-on-windows-os/)

+ [全文搜索引擎 Elasticsearch 入门教程](http://www.ruanyifeng.com/blog/2017/08/elasticsearch.html)

+ [curl](https://www.jianshu.com/p/07c4dddae43a)
+ [Kibana可视化](https://segmentfault.com/a/1190000015140923)
+ [kibana使用的lucene查询语法](https://segmentfault.com/a/1190000002972420)