# bitcoin

## public key
+ 接收bitcoin
+ 每次收bitcoin都用新的公钥，保护隐私

## private key
+ sign transactions to spend the funds

## trasaction
+ transaction as double-entry bookkeeping
+  A chain of transactions, where the output of one transaction is the input of the next transaction.
    + change output.(找零给自己)
    + payment output
+ changeless transactions,
    + has no change output
+  selecting inputs and generating outputs to build a transaction 
    + coin selection
    + consolidation transaction
    + payment batching
+ unspent transaction outputs (UTXOs).

## blockchian
+ Transactions are bundled into blocks
+ proof of work (PoW)
+ candidate block 
+ best blockchain
    + 最长链原则
    + 
    + 

## UTXO模型
+ 还没有被下一个交易花费的Output被称为UTXO(Unspent Transaction Output)
    + 交易 = “花费旧 UTXO” + “生成新 UTXO”
    + 类似找零
+ 交易
    + 若干input
        + 一个Input指向的是前面区块的某个Output
    + 若干output
    + Coinbase交易（矿工奖励的铸币交易）
        + 没有input,只有output
    + input的源头是Coinbase

## 钱包管理
+ 钱包程序必须从创世区块开始扫描每一笔交易
+ 遇到某笔交易的某个Output是钱包管理的地址之一，则钱包余额增加
+ 遇到某笔交易的某个Input是钱包管理的地址之一，则钱包余额减少
+ 钱包的当前余额总是钱包地址关联的所有UTXO金额之和。
+ 钱包会扫一遍区块链，建立地址和余额的索引，leveldb存储
+ Segwit地址
    + bc开头的地址
    + 隔离见证兼容地址（Nested Segwit Address）
        + 3开头

## HD钱包(Hierarchical Deterministic)
+ 一个根私钥
    + 计算出多个子私钥
        + 每个私钥可以对应一个公钥，一个钱包地址
            + 每一笔UTXO都有独立的地址，包含隐私
+ kn=hdkey(k,n)

## tips
+ Bitcoin Improvement Proposals (BIPs).
+ P2PK
    + pay to public key
    + output script
+ P2PKH
    + paying to a public key hash 
+ Base58check Encoding
+ wallet import format (WIF) 


## ref
<!-- bitcoin trade -->
+ Bitcoin Average
+ CoinCap
+ Chicago Mercantile Exchange Bitcoin Reference Rate
<!-- blockchain explorer -->
+ [blockstream](https://blockstream.info/)
+ [mempool](https://mempool.space/zh/)
+ [blockcypher](https://live.blockcypher.com/)