# 🛠️ Maintainer Workflow Guide

## Quick Start

1. **Initialize the maintainer** (first time only):
   ```bash
   alias maintainer='.windsurf/scripts/maintainer.sh'
   ```

2. **Create a new feature**:
   ```bash
   maintainer new feature "Add user authentication"
   ```

3. **Add tasks to the feature**:
   ```bash
   maintainer add task 2025-05-24-add-user-auth "Create login form"
   maintainer add task 2025-05-24-add-user-auth "Set up database schema"
   ```

4. **Check status**:
   ```bash
   maintainer status
   ```

## Feature Development Workflow

### 1. Planning Phase
```bash
# Create a new feature
maintainer new feature "Feature Name"

# Add initial tasks
maintainer add task FEATURE-ID "Task description"
```

### 2. Development Phase
1. Move tasks from `backlog/` to `active/` when starting work
2. Update task status in the feature file
3. Move completed tasks to `completed/`

### 3. Review & Cleanup
```bash
# Check what's in progress
maintainer status

# Archive completed features
mv features/COMPLETED-FEATURE.md features/archive/
```

## Tips

- Use descriptive task names
- Break large tasks into smaller ones
- Update task status regularly
- Reference tasks in commit messages

## Example Session

```bash
# Create a new feature
$ maintainer new feature "Add dark mode"
✨ Created new feature: .windsurf/features/2025-05-24-add-dark-mode.md

# Add tasks
$ maintainer add task 2025-05-24-add-dark-mode "Create theme variables"
🎯 Created new task: .windsurf/tasks/backlog/ADDM-001-create-theme-variables.md

# Check status
$ maintainer status
📊 Project Status
================

🚀 Active Features
- 2025-05-24-add-dark-mode (Draft)

🔧 Active Tasks
- ADDM-001-create-theme-variables

📥 Backlog: 3 tasks
```
