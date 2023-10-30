
## lambda Architecture
+ 需要同时处理大规模数据流和离线批处理数据的情况，以满足实时数据分析的需求.
+ lambda 架构的名称来源于希腊字母 "λ"，表示其将数据处理分为不同层次的方法。
+ 结构
    + 批处理层（Batch Layer）：这一层主要用于离线数据处理。数据以批量方式收集、存储和处理，通常使用分布式处理框架如Hadoop。批处理层生成批处理视图，这是对所有数据的全面批量处理结果。
        + a batch system rolls along and provides you with correct output
    + 实时处理层（Speed Layer）：这一层用于处理实时数据流。它使用流处理技术来处理数据流，并生成实时视图，这是对最新数据的快速处理结果。通常，这一层使用流处理引擎如Apache Kafka或Apache Storm。
        + The streaming system gives you low-latency, inaccurate results (either because of the use of an approximation algorithm, or because the streaming system itself does not provide correctness), 
    + 查询层（Serving Layer）：查询层负责合并批处理层和实时处理层的结果，以便提供一致的查询接口。这允许用户以相同的方式查询批处理和实时数据，获得一致的分析结果。
    
## ref
+ [Questioning the Lambda Architecture](http://radar.oreilly.com/2014/07/questioning-the-lambda-architecture.html)