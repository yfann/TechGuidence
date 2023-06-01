


## 网关鉴权
+ APIgateway 负责鉴权
+ 后端服务只有在APIgateway被认证后才能被访问
    + 配置防火墙规则：
        + 只允许API Gateway所在的子网或特定的IP地址访问后端服务
        + 只允许API Gateway发出的请求访问后端服务
            + IP
            + 身份标识
    + 后端服务端点隐藏
        + IP白名单

## 后端服务鉴权

## ref
+ [微服务权限终极解决方案，Spring Cloud Gateway + Oauth2 实现统一认证和鉴权！](https://juejin.cn/post/6850037263707930631)