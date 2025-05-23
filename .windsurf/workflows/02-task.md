---
description: How to break down features into actionable tasks
---
# 02 - Task Breakdown

## Purpose
Convert feature requirements into specific, actionable development tasks.

## Steps

1. **Analyze Feature Requirements**
   - Review the feature file
   - Identify discrete units of work
   - Consider technical dependencies

2. **Create Task Files**
   - One file per logical unit of work
   - Use template: `templates/task-template.md`
   - Naming: `[FEATURE-CODE]-[NUMBER]-short-desc.md`
   - Place in `tasks/backlog/`

3. **Define Task Details**
   - Clear, specific description
   - List of subtasks
   - Dependencies on other tasks
   - Testing requirements

4. **Estimate Effort**
   - Use Fibonacci sequence (1, 2, 3, 5, 8, 13)
   - Consider complexity, not just time
   - Flag anything > 8 for potential further breakdown

5. **Link to Feature**
   - Update feature file with task references
   - Ensure two-way traceability

## Outputs
- Task files in `tasks/backlog/`
- Updated feature file with task links
- Clear implementation path
