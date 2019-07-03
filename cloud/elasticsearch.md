
## cmd
+ `bin\elasticsearch.bat`  运行
+ `curl http://localhost:9200/` 测试是否安装成功
+ `curl -X PUT localhost:9200/test` 新建`test` index(数据库)
+ `curl -X DELETE localhost:9200/test` 删除`test` index

## 语句

+ `GET _cat/indices`
+ `GET <index>/_search` 查询记录
+ `GET <index>/_mapping` 查看index结构
+ `DELETE <index>` 删除index
+ delete by query
```js
POST <index>/_delete_by_query
{
  "query":{
    "match":{
      "beginDate":"20190402"
    }
  }
}
```

## 日期查询

+ `beginDate:{"now-6h" TO "now"}`
+ `beginDate:[2019-01-01 TO 2019-04-04]`


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





## kibana

+ download->unzip
+ `.\bin\kibana.bat`
+ `http://localhost:5601/`

## elasticdump(export/import data)

+ `npm install elasticdump -g`
+ `elasticdump --input=http://<name>:<pwd>@<host>:<port>/<index> --output=aggregate_data.json --type=data`
+ `elasticdump --input=./aggregate_data.json --output=http://localhost:9200/wechat_aggregate --type=data`
```js
// import data
curl -XPOST 'http://jfblouvmlxecs01:9200/test/test/1' -d @lane.json
```

## tips

+ join（Elasticsearch 这样的分布式计算系统执行全 SQL 风格的联结操作代价昂贵。相应地，Elasticsearch 提供了两种形式的联结可以实现水平规模的扩展。）
  - nested 查询效率高,更新时会删除整个文档再建
  - parent-child 更新效率高，`has_child` `has_parent`

## ref
<!-- elastic search -->
+ [offical](https://www.elastic.co/cn/downloads/elasticsearch)
+ [offical start](https://www.elastic.co/start)
+ [Match Query](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/query-dsl-match-query.html)
+ [Elasticsearch: 权威指南](https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html)
+ [ES document API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs.html)
+ [Windows 下安装 ElasticSearch & ElasticSearch head](https://www.jianshu.com/p/4467cfe4e651)
+ [ELASTIC SEARCH: HOW TO INSTALL MARVEL PLUGIN MANUALLY ON WINDOWS OS](https://hassantariqblog.wordpress.com/2016/09/19/elastic-search-how-to-install-marvel-plugin-manually-on-windows-os/)
+ [全文搜索引擎 Elasticsearch 入门教程](http://www.ruanyifeng.com/blog/2017/08/elasticsearch.html)
+ [Date Math](https://www.elastic.co/guide/en/elasticsearch/reference/current/common-options.html#date-math)
+ [Elasticsearch 联结查询(joining queries)](https://www.jianshu.com/p/632363278be4)
+ [elasticsearch 关联查询](https://www.cnblogs.com/double-yuan/p/9798103.html)
<!-- api -->
+ [_bulk](https://www.elastic.co/guide/cn/elasticsearch/guide/current/bulk.html)
<!-- kibana -->
+ [curl](https://www.jianshu.com/p/07c4dddae43a)
+ [Kibana可视化](https://segmentfault.com/a/1190000015140923)
+ [kibana使用的lucene查询语法](https://segmentfault.com/a/1190000002972420) 
+ [config kibana](https://www.elastic.co/guide/en/kibana/current/settings.html)
+ [Histogram to show current and last week data](https://github.com/elastic/kibana/issues/1244)
<!-- issues -->
+ [Elasticsearch 时间类型总结](https://zhuanlan.zhihu.com/p/34240906)
+ [Elasticsearch索引mapping的写入、查看与修改](https://blog.csdn.net/napoay/article/details/52012249)
+ [Kibana可视化 官方](https://www.elastic.co/guide/cn/kibana/current/createvis.html)
+ [kibana使用的lucene查询语法](https://segmentfault.com/a/1190000002972420)
<!-- space -->
+ [Organize your work with Kibana spaces](https://www.elastic.co/blog/introducing-kibana-spaces-for-organization-and-security)
+ [migrate object to space](https://www.elastic.co/blog/how-to-migrate-to-kibana-spaces)

<!-- plugin -->
+ [elasticsearch-dump](https://github.com/taskrabbit/elasticsearch-dump)
+ [Hateoas](https://blog.betomorrow.com/crud-api-with-powerful-search-in-15-minutes-using-spring-and-elasticsearch-183f5a3d77eb)