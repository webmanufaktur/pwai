# $roles API variable / Roles class

Provides management of all Role pages for access control.

In addition to those shown below, the Roles class also inherits all the methods and properties of: PagesType and Wire.

## Common Methods

- `$roles->add($name)` - Add a new role with the given name. Returns a Role.
- `$roles->count($selector = '')` - Count the number of roles matching the given selector. Returns an integer.
- `$roles->find($selector = '')` - Find roles matching the given selector. Returns a PageArray of Role objects.
- `$roles->get($selector)` - Get a single role by the given selector. Returns a Role or NullPage.
- `$roles->save(Role $role)` - Save a role. Returns a boolean.

## Manipulation Methods

- `$roles->add($name)` - Add a new role with the given name. Returns a Role.
- `$roles->delete(Role $role)` - Delete a role. Returns a boolean.
- `$roles->save(Role $role)` - Save a role. Returns a boolean.

## For Hooks Methods

- `$roles->added(Role $role)` - Hook called after a role is added.
- `$roles->deleted(Role $role)` - Hook called after a role is deleted.
- `$roles->saved(Role $role)` - Hook called after a role is saved.

## Usage Examples

```php
// Get a role by name
$role = $roles->get('editor');

// Get a role by ID
$role = $roles->get(42);

// Find roles with a specific selector
$adminRoles = $roles->find('name^=admin-');

// Count roles with a specific selector
$count = $roles->count('name^=admin-');

// Add a new role
$newRole = $roles->add('my-custom-role');
$newRole->title = 'My Custom Role';
$newRole->addPermission('page-edit');
$roles->save($newRole);

// Delete a role
$roleToDelete = $roles->get('name=my-custom-role');
if($roleToDelete->id) {
    $roles->delete($roleToDelete);
}
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/roles/).
