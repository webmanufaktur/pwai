<!-- Action -->
---
name: Rephrase Prompt
description: Rephrase the user prompt in concise technical terms
alwaysApply: false
---

# Task: Rephrase a given prompt

1.  Analyze prompt intent.
2.  Rephrase technically (scope, files, changes), preserving intent.
3.  Output rephrased prompt + "Act on rephrased prompt? [y/n]".
4.  Wait for user response.
5.  On "y": Proceed with rephrased prompt. Start output: "✨✨✨ {name}".
6.  Else: Ask for clarification.
<!-- /Action -->
