---
trigger: glob
globs: *.php
---

# General PHP rules - Rules that always apply to PHP files and logic

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
</rule>
