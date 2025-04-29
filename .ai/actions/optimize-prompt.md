<!-- Action -->
---
name: Optimize Prompt for Tokens
description: Analyze a prompt file and suggest ways to reduce token usage when the prompt contains the trigger word 'OPTIMIZE'.
globs:
alwaysApply: false
---

# Task: Optimize a given prompt file

1.  Check if the user prompt contains the trigger word "OPTIMIZE".
2.  If not present, stop and do nothing further for this action.
3.  If present, receive the target prompt file path from the user/context.
4.  Analyze the content and instructions within the target prompt file.
5.  Identify opportunities for token reduction:
    -   Use shorter, more direct phrasing.
    -   Combine related steps where logical.
    -   Remove redundant instructions or implied actions.
6.  Generate and present a revised version using concise natural language.
7.  Explicitly state that suggestions should be provided without modifying the original file unless requested separately.
8.  If asked, suggest alternative structured formats (e.g., YAML, JSON) explaining potential benefits/dependencies.
<!-- /Action -->
