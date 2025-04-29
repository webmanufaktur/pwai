<action>
---
name: Plan steps
description: Understanding the user prompt, plan step by step solution, and document it when the prompt contains the trigger word 'PLANNING'.
globs: **/*.*
alwaysApply: false
---

# Task: Plan steps

1. Check if the user prompt contains the trigger word "PLANNING".
2. If not present, stop and do nothing further for this action.
3. If present, analyze the given prompt and understand the task.
4. Look for relevant documentation in [.ai/docs/](../docs/).
5. Think about the task step by step and plan the most simple and effective way to complete it.
6. Create a markdown checklist inside the [.ai/tasks/](../tasks/) folder with all necessary phases and steps.
7. Name the file based on prompt/task scope.
8. Do NOT write code yet.
</action>
