

## @ControllerAdvice + @ExceptionHandler 全局处理 Controller 层异常

```java
@ControllerAdvice
public class MyExceptionHandler {

    @ExceptionHandler(value =Exception.class)
	public String exceptionHandler(Exception e){
		System.out.println("未知异常！原因是:"+e);
       	return e.getMessage();
    }
}
```


## ref

+ [@ControllerAdvice + @ExceptionHandler 全局处理 Controller 层异常](https://blog.csdn.net/kinginblue/article/details/70186586)

<!-- details -->
+ [SpringMVC重要注解（二）@ControllerAdvice](https://blog.csdn.net/w372426096/article/details/78429141)
+ [Spring的@ControllerAdvice注解作用原理探究](https://zhuanlan.zhihu.com/p/73087879)