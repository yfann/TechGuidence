# Claude code


## install

<!-- windows -->
+ 
<!-- mac -->
+ `curl -fsSL https://claude.ai/install.sh | bash`
+ `ls ~/.local/bin | grep claude`
+ `echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc`
+ `source ~/.zshrc`
+ `which claude`

## cmd
+ `claude`
+ `claude "fix the build error"`
    + Run a one-time task
+ `claude -p "explain this function"`
    + Run one-off query, then exit
+ `claude -c`
    + 	Continue most recent conversation in current directory
+ `claude -r`
    + 	Resume a previous conversation
<!-- cmd -->
+ `/clear`
+ `/help`
+ `/init`
    + create claude.md
+ `exit`
+ `esc`
    + stop processing
+ `esc` * 2
    + conversation to an earlier point 
<!-- shortcut -->
+ `shift + Tab`
    + accept without permission
+ `shift + Tab` * 2
    + plan mode
        + 广度
+ think,ultrathink
    + think mode
        + 深度
+ `#`
    + memoery mode,给CLAUDE.md添加内容


+ `/compact`
    + summarize the conversation

## CLAUDE.md
+ pretooluse/posttooluse
+ CLAUDE.md
    + /init
    + project level
+ CLAUDE.local.md
    + not shared with other engineers
+ ~/.claude/CLAUDE.md
    + machine level

## hook
+ global
    + ~/.claude/settings.json
+ project
    + .claude/settings.json
+ project(not committed)
    + .claude/settings.local.json

## ref
<!-- official -->
+ [official claude code](https://claude.com/product/claude-code)
+ [claude code docs](https://code.claude.com/docs/en/overview)

<!-- 教程 -->
+ [Claude Code is My Computer](https://steipete.me/posts/2025/claude-code-is-my-computer)
+ [Claude code](https://www.anthropic.com/claude-code)
+ [让 Claude Code 使用其他模型](https://nekonull.me/share/claude-code-3rd-party-model/)
+ [Claude Code 最佳实践](https://zhuanlan.zhihu.com/p/1923376160475181271)
+ [Auto-generating pull request documentation with Claude Code and GitHub Actions](https://solmaz.io/log/2025/05/24/claude-code-pr-autodoc-action/?utm_source=chatgpt.com)
+ [国产大模型接入 Claude Code 教程：以 Doubao-Seed-Code 为例](https://www.ruanyifeng.com/blog/2025/11/doubao-seed-code.html)
+ [claude code courses](https://anthropic.skilljar.com/claude-code-in-action)

<!-- skill -->
+ [Agent Skills](https://code.claude.com/docs/en/skills)
+ [claude agent skill](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)


<!-- plugin -->
+ [planning-with-files](https://github.com/OthmanAdi/planning-with-files/tree/master?tab=readme-ov-file)