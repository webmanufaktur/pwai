# templates()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/templates/)

## Overview

The `templates()` function provides access to the Templates API, used for retrieving and managing template objects.

## Usage

```php
// Get the Templates object
$templates = templates();

// Find a template by name
$template = templates()->get('basic-page');
```

## Common Methods
- `get($name)`: Get a template by name.
- `add($data)`: Add a new template.
- `delete($template)`: Delete a template.

## Notes
- Equivalent to using the `$templates` API variable.

## See Also
- [$templates](./templates-variable.md)
