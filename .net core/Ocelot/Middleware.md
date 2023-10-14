# ASP.NET Core middleware

## request delegate
+ The ASP.NET Core request pipeline consists of a sequence of request delegates, called one after the other.
+ extension methods
    + RUN
        + Run delegates don't receive a next parameter. The first Run delegate is always terminal and terminates the pipeline.
    + Map
        + branching the pipeline
        + `app.Map("/map1", HandleMapTest1);`
    + Use
        + 可以调next

## Built-in middleware

## tips
+ 在`app.UseOcelot()`之前使用Middleware

## ref
+ [Ocelot-Middleware Injection and Overrides](https://ocelot.readthedocs.io/en/latest/features/middlewareinjection.html)
+ [Middleware - ASP.NET Core Demystified](https://exceptionnotfound.net/asp-net-core-demystified-middleware/)
+ [ASP.NET Core Middleware](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/middleware/?view=aspnetcore-7.0)