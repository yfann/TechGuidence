# Openclaw(Moltbot/Clawbot)


## install
+ `curl -fsSL https://openclaw.ai/install.sh | bash`
<!-- onboard -->
+ `openclaw onboard --install-daemon`


## operation
+ `openclaw status`
+ `openclaw gateway status`
+ `openclaw dashboard`
    + http://127.0.0.1:18789/
+ `openclaw update`
+ `openclaw plugins list`
+ `openclaw config show`

## models
+ qwen
+ `claude setup-token`

## setup feishu channel
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

## ref
<!-- official -->
+ [openclaw](https://clawhub.ai/)
+ [clawhub](https://clawhub.ai/)
+ [openclaw github](https://github.com/openclaw/openclaw)

<!-- install -->
+ [保姆级 OpenClaw （原 Clawdbot）飞书对接教程 手把手教你搭建 AI 助手](https://developer.aliyun.com/article/1709615)

<!-- docs -->
+ [openclaw docs](https://docs.openclaw.ai/start/getting-started)
+ [今天，分享Clawdbot记忆系统最佳工程实践](https://zhuanlan.zhihu.com/p/2000210748878632708)
+ [awesome-openclaw-usecases](https://github.com/hesamsheikh/awesome-openclaw-usecases)
