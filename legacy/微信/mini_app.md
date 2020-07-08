


## issue

+ picker中`indicator-style`单位需为px,子节点高度会自动一致(用rpx,子节点view的高度会是默认的34px)
```js
    <picker-view indicator-style="height:25px;" class="year-list" value="{{year}}" bindchange="bindChange">
     <picker-view-column>
        <view wx:for="{{years}}" style="line-height:50rpx;" class="picker-text">{{item}}</view>
     </picker-view-column>
  </picker-view>
```


## ref
+ [start](https://developers.weixin.qq.com/miniprogram/dev/framework/)
+ [小程序开发指南](https://developers.weixin.qq.com/ebook?action=get_post_info&docid=0008aeea9a8978ab0086a685851c0a)
+ [全局配置](https://developers.weixin.qq.com/miniprogram/dev/reference/configuration/app.html)
+ [微信小程序数据分析](https://developers.weixin.qq.com/miniprogram/dev/api-backend/analysis.getDailyRetain.html)
+ [Taro](https://nervjs.github.io/taro/docs/GETTING-STARTED.html)
+ [WePY](https://tencent.github.io/wepy/document.html#/?id=%e5%be%ae%e4%bf%a1%e5%b0%8f%e7%a8%8b%e5%ba%8f%e7%bb%84%e4%bb%b6%e5%8c%96%e5%bc%80%e5%8f%91%e6%a1%86%e6%9e%b6wepy%e5%ae%98%e6%96%b9%e6%96%87%e6%a1%a3)
+ [入坑微信小程序](https://sunmengyuan.github.io/garden/2018/01/04/xcx-gm.html)
+ [小程序登录鉴权](https://juejin.im/post/5ac9b72cf265da23906c486a)
+ [微信OAuth2.0](https://www.jianshu.com/p/1c48ec65936b)
+ [小程序分享](https://www.jianshu.com/p/c100d21bcc9c)
+ [微信小程序如何裁剪图片作为转发封面](https://www.jianshu.com/p/12fdfb152906)
+ [微信小程序canvas生成分享图到相册](https://www.jianshu.com/p/01f526a4f948)