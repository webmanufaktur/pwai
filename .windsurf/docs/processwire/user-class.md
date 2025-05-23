# User

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/user/)

## Overview

`User` represents a user account in ProcessWire, providing access to user properties and methods.

## Usage

```php
$user = $users->get('admin');
echo $user->name;
```

## Common Properties

- `id`: The user's ID.
- `name`: The user's username.
- `email`: The user's email address.
- `roles`: A WireArray of Role objects assigned to the user.

## Common Methods

- `hasRole($role)`: Checks if the user has a specific role.
- `isGuest()`: Checks if the user is a guest user.
- `isSuperuser()`: Checks if the user is a superuser.

## See Also
- [$user Variable](https://processwire.com/api/ref/user/)
- [$users Variable](https://processwire.com/api/ref/users/)
- [Role Class](https://processwire.com/api/ref/role/)
