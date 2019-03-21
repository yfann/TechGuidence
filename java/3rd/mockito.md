

## mockito tips

+ `@RunWith(MockitoJUnitRunner.class)`UT类上加
+ `@InjectMocks`要测的类
+ `@Mock`可以注入到测试类中的模拟类，方法都返回null
+ `@Spy`同@Mock，可以跑完实际代码返回模拟结果
<!-- method -->
+ `Mockito.when(wechatAggregateLogService.getToken(Mockito.anyString(),Mockito.<EncryptRequest> any())).thenReturn("123")`
+ `Mockito.any(EncryptRequest.class)`
+ `verify(wechatAggregateLogService,times(1)).getDailyRetain("123")`
+ Mockito.when时,如果参数都用any可能引起异常
+ `doNothing().when([instance]).[method(params...)]`
+ `Class obj=Mockito.mock(Class)`
<!-- example -->
+ `restTemplate.exchange(Mockito.anyString(),Mockito.eq(HttpMethod.GET),Mockito.any(),Mockito.<Class<String>> any()`

## tips for mocking
+ private 变量设值`ReflectionTestUtils.setField(jarainUserLoginServiceImpl, "jarainLoginUrl", "http://foo");`
+ private method `eflectionTestUtils.invokeMethod(tFoo, "onStarted");`
+ powermock mock私有方法
+ 用protected和spy代替私有方法
+ 可以创建一个继承源测试类的类，来mock protected方法
+ FieldSetter


## example

<!-- mock 行内实例 -->
```java
class Test {
    // mock
    private Person person = new Person();
    ...
}

@RunWith(PowerMockRunner.class)
@PrepareForTest({ Test.class })
public class SampleTest {
@Mock
Person person;
@Test
public void testPrintName() throws Exception {
    PowerMockito.whenNew(Person.class).withNoArguments().thenReturn(person);
    Test test= new Test();
    test.testMethod();
    }
}
```

<!-- mock 被测试对象方法 -->
```java
    @Spy
    @InjectMocks
    private RequestHandler requestHandler;
    //decryptPayload 会执行
    Mockito.when(requestHandler.decryptPayload(Mockito.anyString())).thenReturn("123");
    //decryptPayload 不会执行
    Mockito.doReturn("123").when(requestHandler).decryptPayload(Mockito.anyString());

```
<!-- mock 私有属性 -->
```java
    UserService userService = new UserService(Mockito.mock(UserDao.class));
    Field apiField = UserService.class.getDeclaredField("external");
    ExternalApi external = Mockito.mock(ExternalApi.class);
    FieldSetter.setField(userService, apiField, external);
```

## ref

+ [Mockito examples](https://www.programcreek.com/java-api-examples/index.php?source_dir=androidannotations-master/functional-test-1-5/src/test/java/org/androidannotations/test15/rest/HttpMethodServiceTest.java)
+ [powermock](https://github.com/powermock/powermock/wiki/Mockito)
+ [使用 Mockito 修改私有属性](https://yanbin.blog/mockito-modify-private-field/)
