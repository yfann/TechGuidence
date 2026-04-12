# Openclaw(Moltbot/Clawbot)



## install

+ install openclaw
    + `npm install -g openclaw@latest`
+ install gateway
    + `openclaw onboard --install-daemon`

+ `openclaw --version`

<!-- update -->
+ `openclaw update`
<!-- repair -->
+ `openclaw doctor`



## operation
+ `openclaw gateway restart`

<!-- status -->
+ `openclaw`
+ `openclaw status`
+ `openclaw gateway status`
+ `openclaw channels list`
+ `openclaw config show`

<!-- channel -->
+ `openclaw plugins list`
+ openclaw channels add

<!-- models -->
+ `openclaw models set qwen-portal/coder-model`
+ `openclaw models list`
<!-- web ui -->
+ `openclaw dashboard`
    + http://127.0.0.1:18789/
<!-- tui -->
+ `openclaw tui`
    + `/model minimax-portal/MiniMax-M2.7`
<!-- model -->





## channel
<!-- feishu -->
+ `openclaw plugins install @m1heng-clawd/feishu`
+ `openclaw config set channels.feishu.appId <app id>`
+ `openclaw config set channels.feishu.appSecret <app secret>`
+ `openclaw config set channels.feishu.enabled true`
+ `openclaw config set channels.feishu.connectionMode websocket`
+ `openclaw config set channels.feishu.dmPolicy pairing`
+ `openclaw config set channels.feishu.groupPolicy allowlist`
+ `openclaw config set channels.feishu.requireMention true`
+ `openclaw gateway restart`
+ `openclaw pairing approve feishu <pairing code>`
<!-- wechat -->
+ `openclaw plugins install "@tencent-weixin/openclaw-weixin@latest"`




## ~/.openclaw/openclaw.json
+ 配置模型key

## pulgin
<!-- install plugin -->
+ `openclaw plugins install "@tencent-weixin/openclaw-weixin@latest"`
+ `openclaw gateway restart`
+ `openclaw plugins list`
+ ~/.openclaw/openclaw.json
    + plugins.allow


## ref
<!-- official -->
+ [openclaw](https://openclaw.ai/)
+ [clawhub](https://clawhub.ai/)
+ [openclaw github](https://github.com/openclaw/openclaw)
+ [pi-mono](https://github.com/badlogic/pi-mono/tree/main)
+ [cli](docs.openclaw.ai/cli)
<!-- install -->
+ [保姆级 OpenClaw （原 Clawdbot）飞书对接教程 手把手教你搭建 AI 助手](https://developer.aliyun.com/article/1709615)

<!-- docs -->
+ [openclaw docs](https://docs.openclaw.ai/start/getting-started)
+ [今天，分享Clawdbot记忆系统最佳工程实践](https://zhuanlan.zhihu.com/p/2000210748878632708)
+ [awesome-openclaw-usecases](https://github.com/hesamsheikh/awesome-openclaw-usecases)
+ [16GB 内存的极限：我在 M4 Mac Mini 上OpenClaw + oMLX 的部署踩坑全过程](https://zhuanlan.zhihu.com/p/2019883129645576759)
