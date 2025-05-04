# Permission

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/permission/)

## Overview

`Permission` represents a permission in ProcessWire, controlling access to various actions and resources.

## Usage

```php
$permission = $permissions->get('page-edit');
echo $permission->name;
```

## Common Properties

- `id`: The permission's ID.
- `name`: The permission's name.

## See Also
- [$permissions Variable](https://processwire.com/api/ref/permissions/)
- [Role Class](./role-class.md)
