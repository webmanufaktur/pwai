<!-- Action -->
---
name: Optimize Prompt for Tokens
description: Analyze a prompt file and suggest ways to reduce token usage
alwaysApply: false
---

# Task: Optimize a given prompt file

1.  Receive the target prompt file path from the user.
2.  Analyze the content and instructions within the target prompt file.
3.  Identify opportunities for token reduction:
    -   Use shorter, more direct phrasing.
    -   Combine related steps where logical.
    -   Remove redundant instructions or implied actions.
4.  Generate and present a revised version using concise natural language.
5.  Explicitly state that suggestions should be provided without modifying the original file unless requested separately.
6.  If asked, suggest alternative structured formats (e.g., YAML, JSON) explaining potential benefits/dependencies.
<!-- /Action -->
