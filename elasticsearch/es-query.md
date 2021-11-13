
# elasticsearch query

+ term-level queries
    + 精确匹配
    + 被查询fields为keyword类型
        + 不可以是 analyzed text fields
    + 所有结果分数一致

+ full-text queries
    + Full-text queries answer how well the documents match a query.
    + 会根据分数从高到低排序

+ Boolean queries
    + The bool query lets you combine multiple search queries with boolean logic

## tips
+ nested array
+ 复杂业务场景
    - 宽表(空间换时间)
    - nested
    - 父子关联join(频繁更新的场景)

## ref
+ [ElasticSearch入门 第六篇：复合数据类型——数组，对象和嵌套](https://www.cnblogs.com/ljhdo/p/4904430.html)
+ [嵌套对象](https://www.elastic.co/guide/cn/elasticsearch/guide/current/nested-objects.html#nested-objects)
+ [Nested query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-nested-query.html)

+ [Term-level queries](https://opendistro.github.io/for-elasticsearch-docs/docs/elasticsearch/term/)