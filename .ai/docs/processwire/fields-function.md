# fields()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/fields/)

## Overview

The `fields()` function provides access to the Fields API, allowing you to retrieve and manage field definitions.

## Usage

```php
// Get the Fields object
$fields = fields();

// Find a field by name
$field = fields()->get('title');
```

## Common Methods
- `get($name)`: Get a field by name.
- `add($data)`: Add a new field.
- `delete($field)`: Delete a field.

## Notes
- Equivalent to using the `$fields` API variable.

## See Also
- [$fields](./fields-variable.md)
