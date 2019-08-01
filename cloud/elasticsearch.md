
## cmd
+ `bin\elasticsearch.bat`  运行
+ `curl http://localhost:9200/` 测试是否安装成功
+ `curl -X PUT localhost:9200/test` 新建`test` index(数据库)
+ `curl -X DELETE localhost:9200/test` 删除`test` index

## kibana dev tools
+ `.\bin\kibana.bat`
+ `http://localhost:5601/`
+ `GET _cat/indices`
+ `GET <index>/_search` 查询记录
```js
GET {index}/_search
{
	"query":{"match_all":{}},
	"size":"100"
}
GET {index}/_search
{
	"query":{"match":{
	  "beginDate":"20190401"
	}},
	"size":"100"
}
```
+ `PUT {index}` 新建index
```js
PUT {index}
{
    "settings" : {
        "index" : {
            "number_of_shards" : 3, 
            "number_of_replicas" : 2 
        }
    }
}
```
+ `GET <index>/_mapping` 查看index结构
+ `DELETE <index>` 删除index
+ `POST <index>` 插入数据
```js
POST <index>/_doc
{"name":"yfann"}

PUT <index>/_doc/1?refresh
{
...
}
```
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
+ `POST {index}/_bulk`  批量导入数据
```js
POST {index}/_bulk
{ "index": { "_type": "wx" }}
{data...}
{ "index": { "_type": "wx" }}
{data...}


//example
POST /company/branch/_bulk
{ "index": { "_id": "london" }}
{ "name": "London Westminster", "city": "London", "country": "UK" }
{ "index": { "_id": "liverpool" }}
{ "name": "Liverpool Central", "city": "Liverpool", "country": "UK" }
{ "index": { "_id": "paris" }}
{ "name": "Champs Élysées", "city": "Paris", "country": "France" }
```

+ `GET /test/_doc/_mget` returns multiple documents

```js
//带id的查询
GET /test/_doc/_mget
{
    "ids" : ["1", "2"]
}
``` 
+ Discover查询`account_number:<100 AND balance:>47500`
+ 日期查询 `beginDate:{"now-6h" TO "now"}``beginDate:[2019-01-01 TO 2019-04-04]`

## postman 查询

+ `Get {host}/_cat/indices`
+ `Post {host}/{index}/_search`+ payload prameter

## parent/child relation                              
+ 一个index只支持一个join field
+ parent and child documents必须在一个shard上,getting,deleting,updating时要提供同样的routing值
+ 建立父子mapping
```js
PUT my_index
{
  "mappings": {
    "_doc": {
      "properties": {
        "{relation field name}": { 
          "type": "join",
          "relations": {
            "{father relation name}": "{child relation name}" 
          }
        }
      }
    }
  }
}
```

+ 插入父document
```js
PUT <index>/_doc/1?refresh
{
  ...
  "{relation field name}": "{father relation name}" 
}
```

+ 插入子document
```js
//The routing value is mandatory because parent and child documents must be indexed on the same shard
PUT <index>/_doc/4?routing={parent id}&refresh
{
  ...
  "{relation field name}": {
    "name": "{child relation name}",
    "parent": "{father id}"
  }
}
```

+ 根据子查父
```js
GET {index}/_search
{
  "query": {
    "has_child": {
      "type": "{child relation name}",
      "query": {
        "match":{
            //{child expression}
        }
      }
    }
  }
}
```


## tips
+ 默认返回10条记录,需要设置`size`参数
+ 查询时curl可以在get时发送request body,postman可以用post查询
+ join（Elasticsearch 这样的分布式计算系统执行全 SQL 风格的联结操作代价昂贵。相应地，Elasticsearch 提供了两种形式的联结可以实现水平规模的扩展。）
  - nested 查询效率高,更新时会删除整个文档再建
  - parent-child 更新效率高，`has_child` `has_parent`
+ `doc['price']`可以加到内存中,`params['_source']`每次都重源文档解析
```js
"source": "doc['price'].value * params.factor"
...
"script" : "params['_source']['message']"
```

## plugin

+ [analysis](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis.html) 默认分词器
+ [ik](https://github.com/medcl/elasticsearch-analysis-ik/) 中文分词插件
+ marvel
    - `elasticsearch-plugin`
+ [x-pack](https://www.elastic.co/guide/en/x-pack/current/installing-xpack.html)

+ elasticdump(export/import data)
    + `npm install elasticdump -g`
    + `elasticdump --input=http://<name>:<pwd>@<host>:<port>/<index> --output=aggregate_data.json --type=data`
    + `elasticdump --input=./aggregate_data.json --output=http://localhost:9200/wechat_aggregate --type=data`
    ```js
    // import data
    curl -XPOST 'http://jfblouvmlxecs01:9200/test/test/1' -d @lane.json
    ```


## ref
<!-- elastic search -->
+ [es documents](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
+ [全文搜索引擎 Elasticsearch 入门教程](http://www.ruanyifeng.com/blog/2017/08/elasticsearch.html)
+ [ES权威指南](https://www.elastic.co/guide/cn/elasticsearch/guide/cn/_who_should_read_this_book.html)
+ [ElasticSearch 中的索引与类型的前生今世](https://www.do1618.com/archives/1276/elasticsearch-%E4%B8%AD%E7%9A%84%E7%B4%A2%E5%BC%95%E4%B8%8E%E7%B1%BB%E5%9E%8B%E7%9A%84%E5%89%8D%E7%94%9F%E4%BB%8A%E4%B8%96/)
+ [Java Clients for Elasticsearch](https://www.elastic.co/cn/blog/found-java-clients-for-elasticsearch)
+ [java调用ES的框架,9300设置认证](https://www.jianshu.com/p/1bfd33ab7a38)
+ [ElasticSearch入门 第六篇：复合数据类型——数组，对象和嵌套](https://www.cnblogs.com/ljhdo/p/4904430.html)
<!-- 原理 -->
+ [dynamic field mapping](https://www.elastic.co/guide/en/elasticsearch/reference/5.6/dynamic-field-mapping.html#dynamic-field-mapping)
+ [索引原理](https://www.elastic.co/guide/cn/elasticsearch/guide/cn/making-text-searchable.html)
+ [倒排索引](https://www.elastic.co/guide/cn/elasticsearch/guide/cn/inverted-index.html)
+ [Routing a Document to a Shard](https://www.elastic.co/guide/en/elasticsearch/guide/current/routing-value.html)
+ [?refresh](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-refresh.html)
+ [elasticsearch中 refresh 和flush区别](https://blog.csdn.net/u011686226/article/details/78531900)
+ [doc_values](https://www.elastic.co/guide/en/elasticsearch/reference/current/doc-values.html#doc-values)
<!-- 查询 -->
+ [Date Math](https://www.elastic.co/guide/en/elasticsearch/reference/current/common-options.html#date-math)
+ [Elasticsearch 联结查询(joining queries)](https://www.jianshu.com/p/632363278be4)
+ [elasticsearch 关联查询](https://www.cnblogs.com/double-yuan/p/9798103.html)
+ [使用kibana或postman操作Elasticsearch的常用命令](https://blog.csdn.net/qq_26230421/article/details/80366649)
+ [parent child join](https://www.elastic.co/guide/en/elasticsearch/reference/6.3/parent-join.html)
+ [**Elasticsearch 中 Parent-Child 关系](https://www.jianshu.com/p/0f0ac93c2fea)
<!-- api -->
+ [ES document API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs.html)
+ [_bulk](https://www.elastic.co/guide/cn/elasticsearch/guide/current/bulk.html)
+ [mget](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-multi-get.html)
<!-- feature -->
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