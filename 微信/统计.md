




## wechat数据分析

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

## wechat

+ [微信统计](https://mp.weixin.qq.com/wxopen/appdatacount?action=get_count_page&lang=zh_CN&type=1&token=339434647&lang=zh_CN)
+ [结合Hive、Sqoop统计日志pv和uv](https://www.jianshu.com/p/8b455354a6a8)
+ [最佳日志实践（v2.0）](https://zhuanlan.zhihu.com/p/27363484)
+ [网站数据统计分析](https://my.oschina.net/leejun2005/blog/292709)
+ [美团点评移动端基础日志库——Logan](https://tech.meituan.com/Logan.html)
+ [B 站日志系统的前世今生](https://juejin.im/entry/59e85ff551882578ca2dba3c)
+ [AARRR](https://www.zhihu.com/question/20417905)

## 百度统计
+ [百度统计](https://mtj.baidu.com/web/demo/newuser?appId=468475)
+ [百度统计，源代码解读](http://willless.com/baidu-statistics-source-code-interpretation.html)
+ [百度统计原理分析](https://segmentfault.com/q/1010000002605331)

## 存储
+ elasticsearch
+ hbase
+ hive
+ mongodb
+ postgresql