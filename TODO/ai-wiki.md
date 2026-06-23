

## llm wiki

+ There are three layers:

**Raw sources** — your curated collection of source documents. Articles, papers, images, data files. These are immutable — the LLM reads from them but never modifies them. This is your source of truth.

**The wiki** — a directory of LLM-generated markdown files. Summaries, entity pages, concept pages, comparisons, an overview, a synthesis. The LLM owns this layer entirely. It creates pages, updates them when new sources arrive, maintains cross-references, and keeps everything consistent. You read it; the LLM writes it.

**The schema** — a document (e.g. CLAUDE.md for Claude Code or AGENTS.md for Codex) that tells the LLM how the wiki is structured, what the conventions are, and what workflows to follow when ingesting sources, answering questions, or maintaining the wiki.



## ref
<!-- base line -->
+ [llm wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

<!-- tools -->
+ [markitdown](https://github.com/microsoft/markitdown)
+ obsidian
+ Obsidian Web Clipper
    + chrome插件： web page to markdown

<!-- practice -->
+ [如何用AI学会所有东西：基于Obsidian+Claude Code的个人知识库构建](https://zhuanlan.zhihu.com/p/2033334385555010512)
+ [如何看待 Karpathy 基于 Obsidian 构建的 LLM WIKI 知识库方案？](https://www.zhihu.com/question/2024074329273411299/answer/2045923959615631587)
    + [https://www.zhihu.com/question/2024074329273411299/answer/2045907028535726846 [2]](https://www.zhihu.com/question/2024074329273411299/answer/2045907028535726846)

<!-- prompts -->
+ [personal-llm-wiki/claude.md](https://github.com/Erber102/personal-llm-wiki/blob/main/claude.md)


<!-- solutions -->
+ [llm_wiki](https://github.com/nashsu/llm_wiki)
    + [deepwiki](https://deepwiki.com/elusivenguyen-dev/LLM-wiki)

+ [LLM-wiki](https://github.com/Ss1024sS/LLM-wiki?utm_source=chatgpt.com)
+ [llm-wiki-karpathy](https://github.com/balukosuri/llm-wiki-karpathy/tree/main)

+ [claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian)
    + [claude-obsidian-ai-second-brain](https://agricidaniel.com/blog/claude-obsidian-ai-second-brain)