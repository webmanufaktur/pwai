---
description: Checks recent file changes and staged files in Git, then generates properly formatted commit messages according to project conventions, grouping similar changes into separate commits.
---

# Task: Generate Git Commit Messages for Changes

1. Check if the user prompt contains a request to generate a commit message or contains the trigger word "COMMIT".
2. If not present, stop and do nothing further for this action.
3. If present, analyze the Git repository state:
   - Check staged files using `git diff --cached --name-status`
   - Check recent file changes using `git status --porcelain`
4. Group the changes based on file types, modifications, and logical relationships:
   - `src/components/`: UI components (group by feature/component)
   - `src/pages/`: Page components (group by route)
   - `src/content/`: Content collections (group by collection type)
   - `src/styles/`: Global styles and Tailwind configuration
   - `public/`: Static assets (images, fonts, etc.)
   - Configuration files (astro.config.mjs, tailwind.config.cjs, etc.)
   - Package management (package.json, package-lock.json)
   - Documentation (README.md, etc.)
5. For each group of related changes:
   - Determine the appropriate commit message prefix:
     - `feat:` for new features
     - `fix:` for bug fixes
     - `perf:` for performance improvements
     - `docs:` for documentation changes
     - `style:` for formatting changes
     - `refactor:` for code refactoring
     - `test:` for adding missing tests
     - `chore:` for maintenance tasks
   - Generate a clear, concise commit message in lowercase
   - Include the scope in parentheses when relevant (e.g., `feat(header): add mobile navigation`)
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
9. After all this is done, output: "🎉 All changes committed successfully."

---

## Flags

`--yolo` = dont ask for permission or changes, use recommended details, add changes, commit changes, and push commits.
