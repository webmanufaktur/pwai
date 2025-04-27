<!-- Rephrasing -->
---
name: Rephrasing
description: Rephrasing the prompt
globs: **/*.*
alwaysApply: true
---
Every time you encounter the exact keyword "rephrase" in a user prompt, do the following:
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
<!-- /Rephrasing -->
