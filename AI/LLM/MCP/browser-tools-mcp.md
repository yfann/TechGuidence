

## install for cline
+ chrome 
    + install  `v1.2.0 BrowserToolsMCP Chrome Extension`
+ terminal 
    + run `npx @agentdeskai/browser-tools-server@1.2.0`
+ cline config
```json
{
  "mcpServers": {
    "browser-tools-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "@agentdeskai/browser-tools-mcp@1.2.0"
      ],
      "env": {},
      "disabled": false,
      "autoApprove": [
        "runAccessibilityAudit",
        "getConsoleLogs",
        "getConsoleErrors",
        "getNetworkErrors",
        "getNetworkLogs",
        "takeScreenshot",
        "getSelectedElement",
        "wipeLogs",
        "runPerformanceAudit",
        "runSEOAudit",
        "runNextJSAudit",
        "runDebuggerMode",
        "runAuditMode",
        "runBestPracticesAudit"
      ]
    }
  }
}
```

## ref
+ [browser-tools-mcp](https://github.com/AgentDeskAI/browser-tools-mcp)
+ [MCP是啥？技术原理是什么？一个视频搞懂MCP的一切。Windows系统配置MCP，Cursor Cline使用MCP](https://www.bilibili.com/video/BV1AnQNYxEsy/?spm_id_from=333.1391.0.0&vd_source=d3c0a53193a65728ad278e633b3790e5)