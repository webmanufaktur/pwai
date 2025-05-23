---
description: Interactive maintainer workflow for task management
---
# 🛠️ Maintainer Workflow

## Purpose
Guide you through feature development from idea to completion with minimal friction.

## Quick Start
```bash
# Start a new feature
/maintainer new feature "Add user authentication"

# Check status
/maintainer status

# Get help
/maintainer help
```

## Main Commands

### Feature Management
- `/maintainer new feature "Name"` - Start a new feature
- `/maintainer list features` - Show all features
- `/maintainer show feature [ID]` - Show feature details

### Task Management
- `/maintainer add task [FEATURE] "Description"` - Add a new task
- `/maintainer start task [TASK-ID]` - Begin working on a task
- `/maintainer complete task [TASK-ID]` - Mark task as complete

### Project Management
- `/maintainer status` - Show project status
- `/maintainer sync` - Sync task statuses
- `/maintainer cleanup` - Archive completed items

## Workflow
1. `new feature` → Creates feature file and initial tasks
2. `add task` → Breaks down features into actionable items
3. `start task` → Moves task to active
4. `complete task` → Moves task to completed
5. `cleanup` → Archives completed features

## Examples
```bash
# Create a new feature
/maintainer new feature "Add dark mode"

# Add tasks to it
/maintainer add task dark-mode "Create theme variables"

# Start working on a task
/maintainer start task DARK-001
```

## Notes
- All commands are interactive
- You'll be prompted for any missing information
- Use tab completion for IDs and commands
