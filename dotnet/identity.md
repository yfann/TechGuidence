#.net Identity [#](http://odetocode.com/blogs/scott/archive/2014/01/03/asp-net-identity-with-the-entity-framework.aspx)

##[ASP.NET Claims-based Authentication](http://www.cnblogs.com/jesse2013/p/aspnet-identity-claims-based-authentication-and-owin.html)

###Claim [#](https://en.wikipedia.org/wiki/Claims-based_identity)

+ Claim is a statement which can be about a name, group, privilege from a provider.
+ Claims-based identity decouple authentication and authorization. The authentication can be handled by a third party(Security token service).
+ Secure token envelope claim.
+ SAML Use Case [#](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language#The_SAML_Use_Case)


###Claims-based identity in .net
+ IIdentity
   
   封装用户信息
   
+ IPrincipal

   代表安全上下文,包含IIdentity,以及角色组，每个线程关联一个IPrincipal,appdomain级
   
+ ClaimsIdentity/ClaimsPrincipal

        protected void Application_AuthenticateRequest()
        {
            var claims=new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name,"yfann"));
            var identity=new ClaimsIdentity(claims,"Login");
            ClaimsPrincipal principal=new ClaimsPrincipal(identity);
            HttpContext.Current.User=principal;
        }


        private IAuthenticationManager AuthenticationManager
        {
            get { return HttpContext.GetOwinContext().Authentication; }
        }
        
        private async Task SignInAsync()
        {
            // 1. 利用ASP.NET Identity获取用户对象
            var user = await UserManager.FindAsync("UserName", "Password");
            // 2. 用数据库取出的数据创建ClaimsIdentity
            var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
            // 3. 将上面拿到的identity对象登录
            AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = true }, identity);
        } 
        
##WIF(Windows Identity Foundation) [#](https://msdn.microsoft.com/en-us/library/hh377151.aspx)
###Form Authentication [#](http://www.cnblogs.com/fish-li/archive/2012/04/15/2450571.html)

        //登录时生成cookie
        FormsAuthentication.SetAuthCookie("Jesse", false);
        //请求asp.net页面时，FormsAuthenticationModule在asp.net管道的AuthenticateRequest阶段检测是否存在cookie，并转化成identity完成认证
        
1. 用户在没有登录的情况下访问了我们需要登录的页面
2. FormsAuthenticationModule检查不到用户身份的cookie，没有生成identity对象，HttpContext.User.IsAuthenticated = false
3. 在ASP.NET 管道 的Authroize 授权阶段，将用户跳转到登录页面
4. 用户输入用户名和密码点击提交
5. 我们检查用户名和密码，如果正确，就调用FormsAuthentication.SetAuthCookie方法生成登录cookie
6. 用户可以正常访问我们需要登录的页面了
7. 用户再次访问我们需要登录的页面
8. FormsAuthenticationModule检查到了用户身份的cookie，并生成identity对象，HttpContext.User.IsAuthenticated = true
9. ASP.NET 管道的 Authroize授权阶段，HttpContext.User.IsAuthenticated=true，可以正常浏览

###Membership [#](http://www.cnblogs.com/jesse2013/p/membership.html)



##[Implementing ASP.NET Identity](http://odetocode.com/blogs/scott/archive/2014/01/20/implementing-asp-net-identity.aspx)

###Core Identity

+ IUser
+ IUserStore(CRUD to DB,dependency on EF DbContext)
+ UserManager(Domain logic,use IUserStore)


##Authorization [#](http://docs.asp.net/en/latest/security/authorization)

###Extension

+ Basic Authentication

##Check CurrentIdentity

        public class ShowWindowsIdentity : IHttpHandler {
            
            public void ProcessRequest (HttpContext context) {
                // 要观察【模拟】的影响，
                // 可以启用，禁止web.config中的设置：<identity impersonate="true"/>
                
                context.Response.ContentType = "text/plain";

                context.Response.Write(Environment.UserDomainName + "\\" + Environment.UserName + "\r\n");
                
                WindowsPrincipal winPrincipal = (WindowsPrincipal)HttpContext.Current.User;
                context.Response.Write(string.Format("HttpContext.Current.User.Identity: {0}, {1}\r\n", 
                        winPrincipal.Identity.AuthenticationType, winPrincipal.Identity.Name));
                
                WindowsPrincipal winPrincipal2 = (WindowsPrincipal)Thread.CurrentPrincipal;
                context.Response.Write(string.Format("Thread.CurrentPrincipal.Identity: {0}, {1}\r\n",
                        winPrincipal2.Identity.AuthenticationType, winPrincipal2.Identity.Name));

                WindowsIdentity winId = WindowsIdentity.GetCurrent();
                context.Response.Write(string.Format("WindowsIdentity.GetCurrent(): {0}, {1}",
                        winId.AuthenticationType, winId.Name));
            }

