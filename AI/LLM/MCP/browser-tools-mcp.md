

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