<!-- Understanding -->
---
name: Understanding
description: Understanding the prompt, plan step by step solution, and document it.
globs: **/*.*
alwaysApply: true
---
1. Analyze the given prpmpt and understand the task.
2. Look for relevant documentation in [.ai/docs/](/.ai/docs/).
3. Think about the task step by step and plan the most simple and effective way to complete it.
4. Do NOT write code yet and put your suggestions in a markdown checklist inside the [.ai/sop/](/.ai/sop/) folder.
<!-- /Understanding -->


<!-- Feedback -->
---
name: Feedback
description: Giving feedback to user
globs: **/*.*
alwaysApply: true
---
1. Begin every response with "✨✨✨".  
2. Quote found documentation with "🔥🔥🔥" and {name} of file.  
3. Whenever applying a rule or set of rules, explicitly output with "🎉🎉🎉" and {name} of rule
<!-- /Feedback -->


<!-- Rephrasing -->
---
name: Rephrasing
description: Rephrasing the prompt
globs: **/*.*
alwaysApply: true
---
Every time you encounter the exact keyword "rephrase" in a user prompt, do the following:
1. analyze the given prompt and understand the intention
2. rephrase the user prompt in concise technical terms focusing on:
   - specific technical task scope
   - affected components/files
   - required functionality changes
3. preserve the users intent in the rephrased prompt
4. output the rephrased prompt and ask for confirmation with exact phrase "Act on the rephrased prompt? [y/n]"
5. IMPORTANT: after asking for confirmation, STOP and wait for explicit user response
6. proceed ONLY after receiving "y" confirmation, otherwise ask for clarification
7. when proceeding, act only on the rephrased prompt and start your output with "✨✨✨" and {name} of rule
<!-- /Rephrasing -->


<!-- PHP Rules -->
---
name: General PHP rules
description: Rules that always apply to PHP files and logic
globs: **/*.php
alwaysApply: false
---
## Project Code Style and Conventions
- Write concise, technical PHP 8.2 code with accurate examples
- Use functional and declarative programming patterns
- Prefer iteration and modularization over code duplication
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError)
- Follow ProcessWire coding style guide
- Use UTF-8 without BOM
- Use spaces for indentation (2 spaces)
- Follow namespace conventions: `ProcessWire`
- Use StudlyCaps for classes
- Use camelCase for methods and constants
- Use snake_case for field names
- Use kebab-case for template names

## Error Handling
- Use ProcessWire's error logging
- Implement proper exception handling
- Create custom error messages
- Return appropriate status codes
- Write to log files using $log

## Code Quality
- Use PHPDoc for inline documentation
- Declare visibility on all properties/methods
- Write hookable methods where needed
- Use type hints where possible

## Security
- Sanitize all input using ProcessWire's $sanitizer
- Implement proper authentication
- Use CSRF protection
- Never expose sensitive data

## Development Workflow
- Use proper version control using Git
- Implement proper code review process
- Test in multiple environments
- Follow semantic versioning for releases
- Maintain changelog
<!-- /PHP Rules -->


<!-- Styling Rules -->
---
name: General CSS, TailwindCSS, Twig rules
description: Rules that always apply
globs: **/*.css, **/*.html.twig
alwaysApply: false
---
## UI and Styling
- Use Tailwind CSS for styling
<!-- /Styling Rules -->