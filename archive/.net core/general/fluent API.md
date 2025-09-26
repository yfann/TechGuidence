# Fluent API

## Entity Framework (EF) Fluent API
+ 在 Entity Framework 中，Fluent API 用于配置数据库映射规则，而不是使用数据注解。通过 Fluent API，可以更灵活地定义实体之间的关系、主键、外键等数据库映射细节
```c#
modelBuilder.Entity<Student>()
    .HasKey(s => s.StudentId)
    .Property(s => s.Name)
    .HasMaxLength(100);

```
## ASP.NET Core MVC 配置路由
+ 在 ASP.NET Core MVC 中，Fluent API 用于配置路由规则，通过链式调用来定义路由约束和模板。
```c#
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
});
```


## ref
+ [Fluent API - Configuring and Mapping Properties and Types](https://learn.microsoft.com/en-us/ef/ef6/modeling/code-first/fluent/types-and-properties)