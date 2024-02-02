# ExpandoObject 
+ ExpandoObject 是在 .NET 中引入的一种动态类型，它允许你在运行时动态地向对象添加属性和方法。ExpandoObject 实现了 IDictionary<string, object> 接口，因此你可以像操作字典一样操作 ExpandoObject。它属于 System.Dynamic 命名空间。

```C#
using System;
using System.Collections.Generic;
using System.Dynamic;

class Program
{
    static void Main()
    {
        // 创建一个动态对象
        dynamic person = new ExpandoObject();

        // 添加属性
        person.Name = "John Doe";
        person.Age = 30;

        // 添加方法
        person.SayHello = new Action(() => Console.WriteLine($"Hello, my name is {person.Name} and I'm {person.Age} years old."));

        // 访问属性和调用方法
        Console.WriteLine($"{person.Name}, {person.Age} years old");
        person.SayHello();
    }
}
```