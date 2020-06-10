## 云原生

### 两个基础理论
+ 不可变基础设施(容器镜像,更新只更新镜像，然后替换原有服务)
    - 基础设置一致性和可靠性
    - 简单可预测的部署和运维（自描述，自运维）
+ 运应用编排理论(容器设计模式)



## keyword

+ cloud native computing foundation (cncf)
+ Kubernetes
+ containerd
+ etcd
+ Envoy
+ SSH连到服务器
+ golang
+ alpine
+ etcd
<!-- liunux -->
+ namespace
+ cgroup
+ chroot
+ pstree -p
+ systemd
+ ECS
+ VPC

## 日志

+ 日志查询：$Search |$Analytics
```sql
status>200 |select avg(latency),max(latency) ,count(1) as c GROUP BY  method  ORDER BY c DESC  LIMIT 20
```
+ 日志投递OSS,MaxCompute

## 网关

+ app 是api的调用者
+ api属于一个api分组
+ 可以绑定独立域名到api分组上
+ www.[独立域名].com/[Path]?[HTTPMethod]。
    - api网关通过域名寻址定位唯一的分组
    - 通过path+method 定位分组下的唯一api
+ 认证方式
    - OpenId Connect/JWT(基于OAuth2)
    - 阿里云APP认证
        + 签名认证
        + 简单认证（APPCode）
            - 免去了复杂签名
            - AppCode明文在网络传递
    - JWT认证插件


## tips

+ 自定义日志追踪(API网关>分组管理)
    - 工作在共享实例(VPC)模式下
    - customTraceId(日志中的key)

## ref
+ [阿里云公开课](https://edu.aliyun.com/roadmap/cloudnative)
+ [阿里云帮助文档](https://help.aliyun.com/?spm=a2c4g.11186623.6.538.2d657d2cgpeamK)

+ [Ingress](https://www.jianshu.com/p/189fab1845c5)
+ [API网关](https://help.aliyun.com/document_detail/29475.html?spm=a2c4g.11186623.2.11.13487355z3WvjM)
+ [云盘存储卷使用说明](https://www.alibabacloud.com/help/zh/doc-detail/86612.htm)
+ [大数据学习路线](https://edu.aliyun.com/roadmap/bigdata)
+ [***云原生***](https://jimmysong.io/)
<!-- 日志服务 -->
+ [日志服务](https://help.aliyun.com/document_detail/63459.html)
+ [search query](https://help.aliyun.com/document_detail/29060.html?spm=a2c4g.11186623.2.15.1a796f20ZBi4W6)
+ [实时分析简介](https://help.aliyun.com/document_detail/53608.html?spm=a2c4g.11186623.2.23.18253e00uXOGpc)
+ [日志服务(SLS)用户手册](https://promotion.aliyun.com/ntms/act/logdoclist.html?spm=5176.55536.1250727.1.9690121ekqhREz&aly_as=sArNaHyCc)
+ [消费-通过Consumer Library实现高可靠消费](https://help.aliyun.com/document_detail/43841.html?spm=a2c4g.11186623.2.7.428623ffE9g9k2#section-lfd-woz-kjz)
+ [查询语法](https://help.aliyun.com/document_detail/29060.html)
+ [日志服务触发器概述](https://www.alibabacloud.com/help/zh/doc-detail/84386.htm?spm=a2c63.p38356.b99.132.247c2136NrHK0r)
+ [loghub](https://www.alibabacloud.com/help/zh/doc-detail/29088.html?spm=a2c5t.10695662.1996646101.searchclickresult.5d4be0b1xj8RBV)
<!-- 网关 -->
+ [API网关访问日志](https://help.aliyun.com/document_detail/64803.html)
+ [1分钟构建API网关日志解决方案](https://developer.aliyun.com/article/326155)
+ [ALIYUN::ApiGateway::Api](https://www.alibabacloud.com/help/zh/doc-detail/61459.htm)
+ [访问控制插件](https://help.aliyun.com/document_detail/154200.html?spm=5176.13794939.0.0.7a426d18LTqQ85)
+ [API网关监控配置](https://yq.aliyun.com/articles/69134?spm=a2c4g.11186623.2.11.739e65602QVWRO)
+ [VPC访问API网关](https://help.aliyun.com/document_detail/127226.html?spm=a2c4g.11186623.6.577.624f3d6dWxEUoQ)
+ [查询可配置的系统参数](https://help.aliyun.com/document_detail/43677.html?spm=5176.10695662.1996646101.searchclickresult.3c034526NI1yMW)
+ [阿里云API网关（6）用户指南（开放 API ）](https://www.cnblogs.com/lexiaofei/p/7212199.html)
<!-- 网关认证 -->
+ [使用简单认证（AppCode）方式调用API](https://help.aliyun.com/document_detail/115437.html?spm=a2c4g.11186623.2.22.2e27de9cOqBwSw)
+ [JWT认证插件](https://help.aliyun.com/document_detail/103228.html?spm=a2c4g.11186623.2.19.c68b33daFA9ehU)
+ [OpenId Connect](https://help.aliyun.com/document_detail/48019.html?spm=a2c4g.11186623.6.569.60071335hSXp1s)
+ [客户端签名说明文档](https://help.aliyun.com/document_detail/29475.html?spm=a2c4g.11186623.2.16.4ad854749UU3iq)
+ [后端签名密钥说明文档](https://help.aliyun.com/document_detail/29485.html?spm=a2c4g.11186623.2.11.b4d86288Du20Um)
+ [通过Postman实现API网关的请求签名与调试](https://yq.aliyun.com/articles/629830)
<!-- ESC -->
+ [云服务器 ECS](https://help.aliyun.com/document_detail/108467.html)
<!-- 访问控制RAM -->
+ [访问控制](https://help.aliyun.com/document_detail/28627.html?spm=a2c4g.11186623.6.544.36f31339dgHWm0)
<!-- Kubernetes -->
+ [容器服务Kubernetes版](https://help.aliyun.com/product/85222.html?spm=a2c4g.750001.list.10.a7f17b13YwpgKk)
<!-- CLI -->
+ [阿里云CLI](https://help.aliyun.com/document_detail/110344.html?spm=a2c4g.11186623.6.556.22c916d2yLTb5J)
+ [云命令行](https://help.aliyun.com/document_detail/90256.html?spm=a2c4g.11186623.6.541.4df6a6b0OUEZQK)