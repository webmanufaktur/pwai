<action>
---
name: Commit Changes
description: Checks recent file changes and staged files in Git, then generates properly formatted commit messages according to project conventions, grouping similar changes into separate commits.
globs: **/*.*
alwaysApply: false
---

# Task: Generate Git Commit Messages for Changes

1. Check if the user prompt contains a request to generate a commit message or contains the trigger word "COMMIT".
2. If not present, stop and do nothing further for this action.
3. If present, analyze the Git repository state:
   - Check staged files using `git diff --cached --name-status`
   - Check recent file changes using `git status --porcelain`
4. Group the changes based on file types, modifications, and logical relationships:
   - PHP files: Backend functionality (further group by module/feature)
   - Twig/Latte/JS/CSS files: Frontend changes (group by component/feature)
   - Markdown/text files: Documentation (group by topic/section)
   - Configuration and .dot files: Project setup (group by purpose)
5. For each group of related changes:
   - Determine the appropriate commit message prefix according to the guidelines in [Git Usage Rules](../rules/git-usage.md)
   - Generate a properly formatted commit message specific to that group
   - Create a list of files to be included in this commit
6. Present the proposed commit groups to the user:
   - Show each group with its commit message and affected files
   - Ask "Would you like to proceed with these commits? [y/n/edit]"
7. Wait for user response:
   - On "y": Proceed to commit each group separately
   - On "edit": Allow user to modify the grouping or commit messages
   - On "n": Ask for clarification
8. For each approved commit group:
   - Stage only the files for that group: `git add [files in group]`
   - Commit with the specific message: `git commit -m "[message]"`
   - Output: "✨ Committed: [message]"
9. After all commits are complete, output: "🎉 All changes committed successfully!"
</action>
