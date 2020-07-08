#Owin [#](http://www.asp.net/aspnet/overview/owin-and-katana/an-overview-of-project-katana)  [#](http://owin.org/)

Open Web Server Interface for .NET


###OverView

+ Application

+ Middleware   
pipeline components configured in startup code  
		Func<IDictionary<string, object>, Task>
		OwinMiddleware

+ Server
	- Microsoft.Owin.Host.SystemWeb (IIS)
	- Microsoft.Owin.Host.HttpListener (default selection for Katana self-host API and OwinHost.exe)
	
+ Host
	- IIS/ASP.NET
	- Custom Host
	- OwinHost.exe

###StartUp [#](http://www.asp.net/aspnet/overview/owin-and-katana/owin-startup-class-detection)

中注册Middleware层中使用的组件

IAppBuilder.Use:添加Owin middleware组件到Owin管道   
IAppBuilder.UseStageMarker:为前面添加的middleware指定在IIS管道的哪个阶段执行

		
###Owin OAuth [#](http://www.asp.net/aspnet/overview/owin-and-katana/owin-oauth-20-authorization-server)


##Ref
+ [ASP.NET: Understanding OWIN, Katana, and the Middleware Pipeline](http://www.codeproject.com/Articles/864725/ASP-NET-Understanding-OWIN-Katana-and-the-Middlewa)