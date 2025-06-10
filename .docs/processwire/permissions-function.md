# permissions()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/permissions/)

## Overview

The `permissions()` function provides access to the Permissions API, used for retrieving and managing permission objects.

## Usage

```php
// Get the Permissions object
$permissions = permissions();

// Find a permission by name
$editPermission = permissions()->get('page-edit');
```

## Common Methods
- `get($name)`: Get a permission by name.
- `add($data)`: Add a new permission.
- `delete($permission)`: Delete a permission.

## Notes
- Equivalent to using the `$permissions` API variable.

## See Also
- [$permissions](./permissions-roles.md)
