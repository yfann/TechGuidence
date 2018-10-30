# Java

## cli

+ `jar tvf *.jar` /*查看jar*/
+ `java -jar *.jar` /*运行可执行jar*/

## Tips

+ 一个java文件只允许一个public class,文件名要与public class相同(大小写敏感)
+ transient：只修饰属性，不会被序列化(Serializable)
+ `System.out::println` 等于`x -> System.out.println(x)`,是lambda的简写,叫eta-conversion/eta-expansion,'类名::方法名'

## ref

+ [funbook](http://www.runoob.com/java/java-tutorial.html)
+ [廖雪峰](https://www.feiyangedu.com/category/JavaSE)
+ [Stream](https://www.ibm.com/developerworks/cn/java/j-lo-java8streamapi/index.html)
+ [Java 8 新特性](http://www.runoob.com/java/java8-new-features.html)