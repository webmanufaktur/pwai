<action>
---
name: Write Action
description: Write a new action file based on user input when the prompt contains the trigger word 'ACTION'.
globs: **/*.*
alwaysApply: false
---

# Task: Write a new action file

1. Check if the user prompt contains a request to write a new action file or contains the trigger word "ACTION".
2. If not present, stop and do nothing further for this action.
3. Extract the intended action name, description, and purpose from the user's prompt.
4. Determine if the action should apply to specific file types (globs).
5. Determine if the action should always apply (alwaysApply).
6. Create the new action file with the appropriate structure.
7. Ask the user to confirm the created action file.
8. On confirmation, save the file to the .ai/actions directory.

## Action template

Filename: `actions/{name}.md`

```markdown
<action>
---
name: Action name
description: Action description
globs: <file and folder matching patterns, like: `**/*.php`>
alwaysApply: boolean
---

# Task: Action purpose and scope

1. Steps
2. to complete
3. the tasks requested
4. ...
</action>
```

## Implementation

1. Parse the user's request for key details:
   - Action name (convert to kebab-case for filename)
   - Action description (brief, focused on what it does)
   - Trigger word (usually uppercase, like "ACTION", "REPHRASE")
   - File type targets (if any)
   - Whether it should always apply

2. Generate the action file structure:
   - Use the template above
   - Fill in all metadata fields
   - Create clear, numbered steps for execution
   - Include any conditional logic needed

3. Present the generated action to the user:
   - Show the full content
   - Ask for confirmation or changes
   - On approval, create the file in .ai/actions/{name}.md

4. Confirm successful creation with: "✨ New action '{name}' created successfully"
</action>
