
# elasticsearch query

+ term-level queries
    + 精确匹配
    + 被查询fields为keyword类型
        + 不可以是 analyzed text fields
    + 所有结果分数一致

+ full-text queries
    + Full-text queries answer how well the documents match a query.
    + 会根据分数从高到低排序
    + text field

+ Boolean queries
    + The bool query lets you combine multiple search queries with boolean logic


+ aggregation
    + 支持keyword
    + 默认不支持text field
        + 设置`fielddata:true`

## tips
+ nested array
+ 复杂业务场景
    - 宽表(空间换时间)
    - nested
    - 父子关联join(频繁更新的场景)

+ 自动创建的mapping的text字段中
    + 包含`.keyword`

+ collapse


+ inner hits
    + for `nested` field

+ `top_hits`  一般用于bucket aggs后的子聚合，根据排序取前几
    + `from`
    + `size`
    + `sort`

## ref
+ [ElasticSearch入门 第六篇：复合数据类型——数组，对象和嵌套](https://www.cnblogs.com/ljhdo/p/4904430.html)
+ [嵌套对象](https://www.elastic.co/guide/cn/elasticsearch/guide/current/nested-objects.html#nested-objects)
+ [Nested query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-nested-query.html)
<!-- query -->
+ [Term-level queries](https://opendistro.github.io/for-elasticsearch-docs/docs/elasticsearch/term/)
+ [关于inner_hits](https://www.jianshu.com/p/0d6488a8072b)
+ [Top hits aggregation](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-top-hits-aggregation.html)
+ [Filter aggregation](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-filter-aggregation.html)


<!-- collapse -->
+ [collapse](https://elasticsearch.cn/article/132)
+ [collapse text field](https://discuss.elastic.co/t/how-to-return-distinct-values-from-query-based-on-a-field/228000)
+ [Field collapsing](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/search-request-collapse.html)
<!-- dynamic mapping -->
+ [Dynamic field mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/dynamic-field-mapping.html)
