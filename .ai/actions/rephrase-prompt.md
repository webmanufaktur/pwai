<!-- Action -->
---
name: Rephrase Prompt
description: Rephrase the user prompt in concise technical terms when the prompt contains the trigger word 'REPHRASE'.
alwaysApply: false
---

# Task: Rephrase a given prompt

1.  Check if the user prompt contains the trigger word "REPHRASE".
2.  If not present, stop and do nothing further for this action.
3.  If present, analyze the rest of the prompt intent.
4.  Rephrase technically (scope, files, changes), preserving intent.
5.  Output rephrased prompt + "Act on rephrased prompt? [y/n]".
6.  Wait for user response.
7.  On "y": Proceed with rephrased prompt. Start output: "✨✨✨ {name}".
8.  Else: Ask for clarification.
<!-- /Action -->
