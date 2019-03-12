

## tips

+ `@RunWith(MockitoJUnitRunner.class)`UT类上加
+ `@InjectMocks`要测的类
+ `@Mock`可以注入到测试类中的模拟类，方法都返回null
+ `@Spy`同@Mock，可以跑完实际代码返回模拟结果
<!-- method -->
+ `Mockito.when(wechatAggregateLogService.getToken("1","1")).thenReturn("123")`
+ `verify(wechatAggregateLogService,times(1)).getDailyRetain("123")`