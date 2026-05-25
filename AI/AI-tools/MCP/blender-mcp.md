

## prerequisite
+ blender 3.0+
+ python 3.1+
+ uv

## install
+ `brew install uv`
<!-- setting blender -->
+ blender > edit > preference > Add-ons > install > addon.py
    + enable addon
    + 窗口找到BlenderMCP>start MCP server

<!-- setting for cursor -->
+ Cursor > settings > cursor setting > MCP
    + `uvx blender-mcp`

## issues
+ cursor client closed
    + 先在cursor terminal 运行一遍`uvx blender-mcp`

## tips
+ cursor settings > Features > Enable yolo mode
    + 让agent自动运行，不用每次都点

## ref
+ [blender-mcp](https://github.com/ahujasid/blender-mcp)