<!-- Global Rule: 1 -->
---
name: Global Rule #1
description: The very first global rule to apply the moment the user starts a task
globs: **/*.*
alwaysApply: true
---

# Before starting a task

1. analyze the given prompt and understand the intention
2. rephrase the user prompt in concise technical terms focusing on:
   - specific technical task scope
   - affected components/files
   - required functionality changes
3. preserve the users intent in the rephrased prompt
4. output the rephrased prompt and ask for confirmation with exact phrase "Act on the rephrased prompt? [y/n]"
5. IMPORTANT: after asking for confirmation, STOP and wait for explicit user response
6. proceed ONLY after receiving "y" confirmation, otherwise ask for clarification
7. when proceeding, act only on the rephrased prompt and start your output with "✨✨✨" and {name} of rule
<!-- /Global Rule: 1 -->
