#.net Identity [#](http://odetocode.com/blogs/scott/archive/2014/01/03/asp-net-identity-with-the-entity-framework.aspx)

##[ASP.NET Claims-based Authentication](http://www.cnblogs.com/jesse2013/p/aspnet-identity-claims-based-authentication-and-owin.html)

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
        
##Form Authentication

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
