# roles()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/roles/)

## Overview

The `roles()` function provides access to the Roles API, used for retrieving and managing user roles.

## Usage

```php
// Get the Roles object
$roles = roles();

// Find a role by name
$adminRole = roles()->get('admin');
```

## Common Methods
- `get($name)`: Get a role by name.
- `add($data)`: Add a new role.
- `delete($role)`: Delete a role.

## Notes
- Equivalent to using the `$roles` API variable.

## See Also
- [$roles](./permissions-roles.md)
