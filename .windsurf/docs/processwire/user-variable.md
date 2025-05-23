# $user API variable / User class

The $user API variable is a type of page representing the current user, and the User class is Page type used for all users.

In addition to those shown below, the User class also inherits all the methods and properties of: Page, WireData, and Wire.

## Common Methods

- `$user->addRole($role)` - Add a role to this user.
- `$user->can($name)` - Check if this user has the given permission.
- `$user->hasPermission($name)` - Check if this user has the given permission.
- `$user->hasRole($role)` - Check if this user has the given role.
- `$user->isGuest()` - Check if this user is a guest (not logged in).
- `$user->isLoggedin()` - Check if this user is logged in.
- `$user->isSuperuser()` - Check if this user is a superuser.
- `$user->removeRole($role)` - Remove a role from this user.
- `$user->roles()` - Get all roles for this user.

## Access Methods

- `$user->addRole($role)` - Add a role to this user.
- `$user->can($name)` - Check if this user has the given permission.
- `$user->hasPermission($name)` - Check if this user has the given permission.
- `$user->hasRole($role)` - Check if this user has the given role.
- `$user->isGuest()` - Check if this user is a guest (not logged in).
- `$user->isLoggedin()` - Check if this user is logged in.
- `$user->isSuperuser()` - Check if this user is a superuser.
- `$user->removeRole($role)` - Remove a role from this user.
- `$user->roles()` - Get all roles for this user.

## Languages Methods

- `$user->language()` - Get or set the user's language.
- `$user->setLanguage(Language $language)` - Set the user's language.

## Properties

- `id` - The user's ID.
- `name` - The user's name.
- `email` - The user's email address.
- `roles` - The user's roles.
- `language` - The user's language.
- `admin_theme` - The user's admin theme.

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/user/).
