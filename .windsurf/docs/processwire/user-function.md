# user()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/user/)

## Overview

The `user()` function returns the current user object or a user by ID or name.

## Usage

```php
// Get the current user
$current = user();

// Get a user by name
$admin = user('admin');
```

## Notes
- Equivalent to using the `$user` API variable.

## See Also
- [$user](./user-variable.md)
- [users()](./users-function.md)
