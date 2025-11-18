# web3
+ 区块链、智能合约、DeFi、NFT、DAO、去中心化存储

## tips
+ Polymarket
    + 预测市场（Prediction Market）
    + 侧链
+ Polygon
    + 在Etherenum之上的Layer2扩展网络
    + 链下/侧链交易
        + 不是公链
    + 不是链，多链框架（multi-chain system）
+ 主链（Mainnet / Layer1
    + 以太坊（Ethereum）
        + Gas贵，TPS低
    + 比特币（Bitcoin）
+ Layer2 
    + 构建在主链之上，用来提高速度、降低费用的扩容网络
    + 最终结果提交到主链（保证安全）
        + 费用更低、速度更快
    + 类型
        + Polygon zkEVM
+ 侧链（Sidechain）
    + 侧链是独立运行的区块链，只是和主链互通，但不共享安全性。
    + 速度快、便宜，安全性不等于主链
    + 类型
        + Polygon PoS chain（常说的 Polygon）
+ Pow
    + 通过让计算机做“数学计算”，比拼谁先算出答案，谁就获得记账权并拿区块奖励。
    + 竞争选择
+ Pos（Proof of Stake）
    + 通过“抵押代币（stake）”来获得记账权，而不是靠算力。
    + 随机选择
+ 区块链
    + 就是一个不断增长的全网总账本，每个完全节点都拥有完整的区块链，并且，节点总是信任最长的区块链，伪造区块链需要拥有超过51%的全网算力。

+ 哈希碰撞
    + 把无限的集合映射到有限的集合时必然会产生碰撞

+ bitcoin
    + Double SHA-256
        + 防止 SHA-256 的长度扩展攻击
        + 增强抗碰撞安全性

+ Merkle Hash
    + 交易内容做hash防篡改
+ Block Hash
    + 区块哈希来标识
    + 一个区块自己的区块哈希并没有记录在区块头部，而是通过计算区块头部的哈希得到的
    + 区块头部的Prev Hash记录了上一个区块的Block Hash
    + 如果交易内容被修改，Merkle Hash就会改变，Block Hash也会改变
## ref
<!-- web3 -->
+ [Get-Started-with-Web3](https://github.com/beihaili/Get-Started-with-Web3?tab=readme-ov-file)
+ [Web3开发学习路线](https://54web3.cc/blog/roadmap/learning-path-web3)
+ [chatgpt web3 recommendation](https://chatgpt.com/c/68adbd76-fb20-8321-a3c0-8bf93111d507)
+ [Web3全栈开发指南](https://zhuanlan.zhihu.com/p/605725362)
+ [Mastering Bitcoin: Programming the Open Blockchain (3rd Edition)](https://bitcoinbook.hankmo.com/#_reading_in_single_page)
+ [《精通比特币（第二版）-- 区块链编程》](https://github.com/inoutcode/bitcoin_book_2nd/blob/master/README.md)
+ [区块链](https://liaoxuefeng.com/books/blockchain/bitcoin/basic/index.html)
<!-- others -->
+ [etherscan](https://etherscan.io/)
