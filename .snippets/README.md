# Code Snippets

This directory contains reusable code snippets for the project, organized by technology and purpose.

## Directory Structure

```
.snippets/
├── rockmigrations/    # RockMigrations specific snippets
└── README.md          # This file
```

## Usage

### VS Code
Snippets are automatically loaded from this directory when using the VS Code configuration in `.vscode/`.

### Cursor
Cursor should automatically detect and load snippets from this directory. If not, ensure your `.cursor/settings.json` includes the correct paths.

## Adding New Snippets

1. Create a new file in the appropriate subdirectory
2. Follow the existing naming conventions
3. Add documentation at the top of each snippet file
4. Test the snippet in both IDEs

## Best Practices

- Keep snippets focused and single-purpose
- Include usage examples in the snippet comments
- Document any dependencies or requirements
- Test snippets in isolation before committing
