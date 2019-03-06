## 数据分析

维度|API|属性|说明
--|--|--|--
访问存留|getAnalysisDailyRetain|visit_uv_new|新增用户留存
访问存留|getAnalysisDailyRetain|visit_uv|活跃用户留存
概况|getAnalysisDailySummary|visit_total|累计用户数
概况|getAnalysisDailySummary|share_pv|转发次数
概况|getAnalysisDailySummary|share_uv|转发人数
访问分析|getAnalysisDailyVisitTrend|session_cnt|打开次数
访问分析|getAnalysisDailyVisitTrend|visit_pv|访问次数
访问分析|getAnalysisDailyVisitTrend|visit_uv|访问人数
访问分析|getAnalysisDailyVisitTrend|visit_uv_new|新用户数
访问分析|getAnalysisDailyVisitTrend|stay_time_uv|人均停留时长 
访问分析|getAnalysisDailyVisitTrend|stay_time_session|次均停留时长
访问分析|getAnalysisDailyVisitTrend|visit_depth|平均访问深度
用户画像|getAnalysisUserPortrait|uv/uv_new.province|省份
用户画像|getAnalysisUserPortrait|uv/uv_new.city|城市
用户画像|getAnalysisUserPortrait|uv/uv_new.genders|性别
用户画像|getAnalysisUserPortrait|uv/uv_new.platforms|终端类型(iPhone,android)
用户画像|getAnalysisUserPortrait|uv/uv_new.devices|机型
用户画像|getAnalysisUserPortrait|uv/uv_new.ages|年龄
来源分析|getAnalysisVisitDistribution|。。。|不同场景的pv,uv,时长,深度
页面访问|getAnalysisVisitPage|page_path|页面路径
页面访问|getAnalysisVisitPage|page_visit_pv|访问次数
页面访问|getAnalysisVisitPage|page_visit_uv|访问人数
页面访问|getAnalysisVisitPage|page_staytime_pv|停留时长
页面访问|getAnalysisVisitPage|entrypage_pv|进入页次数
页面访问|getAnalysisVisitPage|exitpage_pv|退出页次数
页面访问|getAnalysisVisitPage|page_share_pv|转发次数
页面访问|getAnalysisVisitPage|page_share_uv|转发人数



## ref

+ [offical](https://developers.weixin.qq.com/miniprogram/dev/index.html)
+ [Taro](https://nervjs.github.io/taro/docs/GETTING-STARTED.html)
+ [WePY](https://tencent.github.io/wepy/document.html#/?id=%e5%be%ae%e4%bf%a1%e5%b0%8f%e7%a8%8b%e5%ba%8f%e7%bb%84%e4%bb%b6%e5%8c%96%e5%bc%80%e5%8f%91%e6%a1%86%e6%9e%b6wepy%e5%ae%98%e6%96%b9%e6%96%87%e6%a1%a3)
+ [入坑微信小程序](https://sunmengyuan.github.io/garden/2018/01/04/xcx-gm.html)
+ [小程序登录鉴权](https://juejin.im/post/5ac9b72cf265da23906c486a)
+ [微信OAuth2.0](https://www.jianshu.com/p/1c48ec65936b)