# 2PC/3PC
+ 1 coordinator + many voter

## 2PC
+ 过程
    1. coordinator向所有participant发送事物内容,询问是否可以提交事物，等待participant的响应
    2. 
+ blocking
+ process
    + propose
    + commit/abort
+ 缺点
    + fail-stop会失败
        + 在commit phase,当coordinator和一个voter挂掉时，无法继续
            + voter处于uncertain
                + blocking

## 3pc
+ nonblocking
+ process
    + propose
    + precommit
        + voter可以知道propose的结果
    + commit

+ 缺点
    + precommit不能处理network partition
        + 由于网络故障，导致两边 的voter做出不同决定
## ref
+ [漫话分布式系统共识协议: 2PC/3PC篇](https://zhuanlan.zhihu.com/p/35298019)