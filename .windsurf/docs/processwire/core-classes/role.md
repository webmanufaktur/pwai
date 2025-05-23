# Role

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/role/)

## Overview

`Role` represents a user role in ProcessWire, defining permissions and access levels.

## Usage

```php
$role = $roles->get('editor');
echo $role->name;
```

## Common Properties

- `id`: The role's ID.
- `name`: The role's name.
- `permissions`: A WireArray of Permission objects assigned to the role.

## Common Methods

- `hasPermission($permission)`: Checks if the role has a specific permission.

## See Also
- [$roles Variable](https://processwire.com/api/ref/roles/)
- [User Class](./user-class.md)
- [Permission Class](https://processwire.com/api/ref/permission/)
