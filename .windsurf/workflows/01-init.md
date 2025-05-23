---
description: How to initiate and plan a new feature
---
# 01 - Feature Initiation

## Purpose
Initialize a new feature with proper documentation and planning.

## Steps

1. **Gather Requirements**
   - Create a new feature file in `.windsurf/features/`
   - Use template: `templates/feature-template.md`
   - Naming: `YYYY-MM-DD-feature-name.md`

2. **Define Scope**
   - Fill in the feature overview
   - List clear goals and acceptance criteria
   - Identify potential technical requirements

3. **Initial Planning**
   - Brainstorm potential tasks
   - Identify dependencies
   - Estimate complexity (T-shirt sizing: S, M, L, XL)

4. **Create Tasks**
   - For each major component, create a task file
   - Use template: `templates/task-template.md`
   - Place in `tasks/backlog/`
   - Link tasks in the feature file

5. **Review**
   - Verify all requirements are covered by tasks
   - Check for missing dependencies
   - Ensure acceptance criteria are testable

## Outputs
- New feature file in `features/`
- Initial task files in `tasks/backlog/`
- Clear next steps for implementation
