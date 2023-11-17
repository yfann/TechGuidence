# Apache Beam
+ Pipeline
+ PCollection
+ Ptransform
+ ParDo
    + 并行处理
    + 应用于每个元素
+ I/O Connector
+ UDF(user defined function)
    + 可用其他语言编写
+ TextIO
    + 用于读取和写入文本文件的 PTransform
+ watermark
+ runner
    + A Beam runner runs a Beam pipeline on a specific platform.
    + For example, the Flink runner translates a Beam pipeline into a Flink job
        + The Direct Runner runs pipelines locally so you can test, debug, and validate that your pipeline adheres to the Apache Beam model as closely as possible.

## PCollection
+ 有界数据
    + 批处理
    + 流处理

+ 无界数据
    + 流处理

## ref
+ [tour of beam guide](https://tour.beam.apache.org/tour/java/introduction/guide)

+ [Basics of the Beam model](https://beam.apache.org/documentation/basics/)
    + [github Apache Beam](https://github.com/apache/beam)

+ [Beam Sample](https://github.com/takidau/streamingbook/blob/master/src/main/java/net/streamingbook/BeamModel.java)

<!-- runner -->
+ [Beam Capability Matrix](https://beam.apache.org/documentation/runners/capability-matrix/)
