# xss
+ cross site scripting



## solution
+ 输入验证与输出转义
+ 配置 Content Security Policy（CSP），指定允许页面加载的资源和执行的脚本来源，限制第三方脚本或内联脚本的执行。
+ 避免直接操作 DOM
+ 避免使用 eval()、setTimeout()、setInterval()
+ cookie
    + 设置 Cookie 为 HttpOnly，防止通过 JavaScript 访问 Cookie，减少攻击者通过 XSS 窃取 Cookie 的机会。
    + 使用 Secure 属性确保 Cookie 仅通过 HTTPS 传输，进一步增强安全性。