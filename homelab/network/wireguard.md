# wireguard
+ VPN协议
+ 使用UDP传输数据
+ 生成公私钥对实现点对点传输


## mac mini
<!-- install -->
+ `brew install wireguard-tools`
    + `wg`
    + `wg-quick`
<!-- cmd -->
+ `wg genkey | tee privatekey | wg pubkey > publickey`
    + 生成公私钥

+ `sudo wg-quick up wg0`
    + `sudo wg-quick up ./wg1.conf`
    + `sudo wg-quick down wg0`
    + 启动关闭服务

+ `sudo wg`
    + 查看状态

<!-- config -->
+ /etc/wireguard/wg0.conf

## config

+ [Interface]
    + 服务端

+ [Peer]
    + 客户端


## ref
+ [wireguard](https://zh-wireguard.com/)
<!-- install -->
+ [install wireguard](https://www.wireguard.com/install/)