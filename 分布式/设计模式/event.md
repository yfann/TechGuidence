## Event Notification
+ 借助MQ解耦下游系统

## Event Carried State Transfer

## Event Sourcing
+ Event Sourcing将所有对系统状态的改变按序保存成为一系列events记录，这样我们就能通过回放这些events来重新构建系统的任何历史和当前状态
+ WAL?

## CARS(Command Query Responsibility Segregation)
+ 针对系统的读写操作，使用不同的数据模型、API接口、安全机制等，来达到对读写操作的完全隔离，满足不同的业务需求

## ref
+ [事件驱动架构event driven的多种含义 by Martin Fowler](https://zhuanlan.zhihu.com/p/92323230)