# 🛠️ Project Maintainer Tool

A simple, project-local task management system for your development workflow.

## Quick Start

1. **Set up bash completion** (recommended):
   ```bash
   # Run the setup script
   ./setup-completion.sh
   
   # Then either restart your terminal or run:
   source ~/.bashrc
   ```

2. **Run the maintainer script**:
   ```bash
   ./maintainer --help
   ```

2. **Create a new feature**:
   ```bash
   ./maintainer new feature "Add user authentication"
   ```

3. **Add tasks to it**:
   ```bash
   ./maintainer add task 2025-05-24-add-user-auth "Create login form"
   ```

4. **Check status**:
   ```bash
   ./maintainer status
   ```

## How It Works

- All data is stored in the `.windsurf/` directory
- No system-wide installation needed
- No dependencies required (just bash)
- Works on Linux and macOS

## Commands

```
./maintainer new feature "Name"    # Create a new feature
./maintainer add task ID "Desc"     # Add a task to a feature
./maintainer status                # Show project status
./maintainer help                  # Show help
```

## Example Workflow

```bash
# Create a new feature
$ ./maintainer new feature "Add dark mode"
✨ Created new feature: .windsurf/features/2025-05-24-add-dark-mode.md

# Add some tasks
$ ./maintainer add task 2025-05-24-add-dark-mode "Create theme variables"
🎯 Created new task: .windsurf/tasks/backlog/ADDM-001-create-theme-variables.md

# Check status
$ ./maintainer status
📊 Project Status
================

🚀 Active Features
- 2025-05-24-add-dark-mode (Draft)

🔧 Active Tasks
- ADDM-001-create-theme-variables

📥 Backlog: 1 task
```

## Notes

- All commands are run from the project root
- No installation or configuration needed
- Works in any shell
- Safe to commit to version control
