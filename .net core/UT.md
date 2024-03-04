
## tips
+ `dotnet add package Autofac.Extras.Moq`

+ AutoFixture
    + AutoFixture 主要用于创建测试数据对象，以简化单元测试中的数据准备。它能够自动创建各种类型的对象，包括填充属性和集合等

+ Moq
    + Moq 专注于创建和管理模拟对象（Mock Objects），用于在单元测试中模拟或替代真实对象的行为。它使得测试人员能够设置模拟对象的行为、验证调用，并进行交互测试。

+ 测试项目要引入`Microsoft.NET.Test.Sdk`

## ref
+ [Unit and integration tests in Minimal API apps](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis/test-min-api?view=aspnetcore-7.0)
+ [mstest](https://learn.microsoft.com/en-us/dotnet/core/testing/unit-testing-with-mstest)
+ [C# Unit Testing — IServiceCollection](https://medium.com/@kevin.dconinck/c-unit-testing-eef38ca9beeb)