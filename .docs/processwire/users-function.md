# users()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/users/)

## Overview

The `users()` function provides access to the Users API, used for retrieving and managing user objects.

## Usage

```php
// Get the Users object
$users = users();

// Find a user by name
$user = users()->get('admin');
```

## Common Methods
- `get($name)`: Get a user by name.
- `add($data)`: Add a new user.
- `delete($user)`: Delete a user.

## Notes
- Equivalent to using the `$users` API variable.

## See Also
- [$users](./permissions-roles.md)
