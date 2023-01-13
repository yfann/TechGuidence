# WAL（write ahead log）

+ 保证事物的原子性

+ 系统崩溃后，可以重构memtable

+ 修改生效之前先写入log
    + log包含redo,undo信息

+ process
    + Write ahead logging
    + Repeating history during Redo
    + Logging changes during Undo


## ref
+ [WAL的概念与实践分析](https://www.modb.pro/db/337488)
+ [WAL(预写式日志)简介](https://lessisbetter.site/2020/01/02/wal-introduction/)
+ [Write-Ahead Log(WAL预写日志)的工作原理](https://cloud.tencent.com/developer/article/1663045)
+ [golang wal 预写日志的设计实现](https://xiaorui.cc/archives/7304)