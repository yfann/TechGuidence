

## mockito tips

+ `@RunWith(MockitoJUnitRunner.class)`UT类上加
+ `@InjectMocks`要测的类
+ `@Mock`可以注入到测试类中的模拟类，方法都返回null
+ `@Spy`同@Mock，可以跑完实际代码返回模拟结果
<!-- method -->
+ `Mockito.when(wechatAggregateLogService.getToken("1","1")).thenReturn("123")`
+ `verify(wechatAggregateLogService,times(1)).getDailyRetain("123")`
+ Mockito.when时,如果参数都用any可能引起异常
+ `doNothing().when([instance]).[method(params...)]`

## tips for mocking
+ private 变量设值`ReflectionTestUtils.setField(jarainUserLoginServiceImpl, "jarainLoginUrl", "http://foo");`

## ref

+ [Mockito examples](https://www.programcreek.com/java-api-examples/index.php?source_dir=androidannotations-master/functional-test-1-5/src/test/java/org/androidannotations/test15/rest/HttpMethodServiceTest.java)
