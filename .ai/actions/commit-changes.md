<!-- Action -->
---
name: Commit Changes
description: Checks recent file changes and staged files in Git, then generates a properly formatted commit message according to project conventions.
globs:
alwaysApply: false
---

# Task: Generate a Git Commit Message

1. Check if the user prompt contains a request to generate a commit message or contains the trigger word "COMMIT".
2. If not present, stop and do nothing further for this action.
3. If present, analyze the Git repository state:
   - Check staged files using `git diff --cached --name-status`
   - Check recent file changes using `git status --porcelain`
4. Categorize the changes based on file types and modifications:
   - PHP files: Backend functionality
   - Twig/Latte/JS/CSS files: Frontend changes
   - Markdown/text files: Documentation
   - Configuration and .dot  files: Project setup
5. Determine the appropriate commit message prefix:
   - "fix:" for bug fixes
   - "feat:" for new features
   - "perf:" for performance improvements
   - "docs:" for documentation changes
   - "style:" for formatting changes
   - "refactor:" for code refactoring
   - "test:" for adding missing tests
   - "chore:" for maintenance tasks
6. Generate a properly formatted commit message following these rules:
   - Use lowercase for commit messages
   - Keep the summary line concise
   - Include description for non-obvious changes
   - Reference issue numbers when applicable
7. Present the generated commit message to the user.
8. Optionally suggest running the appropriate Git commands to commit the changes.
<!-- /Action -->
