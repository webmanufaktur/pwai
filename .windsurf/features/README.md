# Feature Management

This directory contains all feature definitions and their related tasks.

## Structure

```
.windsurf/
├── features/           # Feature definitions
│   ├── templates/     # Document templates
│   └── archive/       # Completed features
└── tasks/             # Task implementation
    ├── active/       # In-progress tasks
    ├── backlog/      # Planned tasks
    └── completed/    # Finished tasks
```

## Workflow

1. **Create a Feature**
   - Copy `templates/feature-template.md` to a new file with format `YYYY-MM-DD-feature-name.md`
   - Fill in the feature details

2. **Create Tasks**
   - For each major piece of work, create a task
   - Use `templates/task-template.md`
   - Name format: `TASK-001-short-description.md`
   - Link tasks back to features using the `Feature:` header

3. **Track Progress**
   - Move task files between `backlog/`, `active/`, and `completed/`
   - Update task status in the feature file

## Naming Conventions

- Feature files: `YYYY-MM-DD-feature-name.md`
- Task files: `TASK-XXX-short-description.md`
- Use kebab-case for all filenames
- Prefix tasks with their parent feature's ID
