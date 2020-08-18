
## tips
+ RAM account 子账号，长期有效
+ STS临时访问授权
    - 返回临时的Accesskey和Token
+ 对临时访问
    - 创建对应的Role
    - 通过STS绑定对应的Role给临时用户返回key,secret,token
## ref

+ [访问控制](https://help.aliyun.com/product/28625.html?spm=a2c4g.750001.list.298.7b417b13rzqHYp)
+ [RAM和STS介绍](https://help.aliyun.com/document_detail/102082.html?spm=a2c4g.11186623.6.692.5f853315OHeOJC)
+ [STS临时授权访问OSS](https://help.aliyun.com/document_detail/100624.html?spm=a2c4g.11186623.6.694.727a71d9nSPj74)
+ [OpenAPI sample](https://api.aliyun.com/?spm=a2c4g.11186623.2.10.793016abprD2U3#/?product=Ram&version=2015-05-01&api=AddUserToGroup&tab=DEMO&lang=JAVA)