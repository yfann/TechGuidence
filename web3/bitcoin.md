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

## mining

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