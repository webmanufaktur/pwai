# $permissions API variable / Permissions class

Provides management of all Permission pages independent of users, for access control.

In addition to those shown below, the Permissions class also inherits all the methods and properties of: PagesType and Wire.

## Common Methods

- `$permissions->add($name)` - Add a new permission with the given name. Returns a Permission.
- `$permissions->count($selector = '')` - Count the number of permissions matching the given selector. Returns an integer.
- `$permissions->find($selector = '')` - Find permissions matching the given selector. Returns a PageArray of Permission objects.
- `$permissions->get($selector)` - Get a single permission by the given selector. Returns a Permission or NullPage.
- `$permissions->save(Permission $permission)` - Save a permission. Returns a boolean.

## Manipulation Methods

- `$permissions->add($name)` - Add a new permission with the given name. Returns a Permission.
- `$permissions->delete(Permission $permission)` - Delete a permission. Returns a boolean.
- `$permissions->save(Permission $permission)` - Save a permission. Returns a boolean.

## For Hooks Methods

- `$permissions->added(Permission $permission)` - Hook called after a permission is added.
- `$permissions->deleted(Permission $permission)` - Hook called after a permission is deleted.
- `$permissions->saved(Permission $permission)` - Hook called after a permission is saved.

## Usage Examples

```php
// Get a permission by name
$permission = $permissions->get('page-edit');

// Get a permission by ID
$permission = $permissions->get(42);

// Find permissions with a specific selector
$pagePermissions = $permissions->find('name^=page-');

// Count permissions with a specific selector
$count = $permissions->count('name^=page-');

// Add a new permission
$newPermission = $permissions->add('my-custom-permission');
$newPermission->title = 'My Custom Permission';
$permissions->save($newPermission);

// Delete a permission
$permissionToDelete = $permissions->get('name=my-custom-permission');
if($permissionToDelete->id) {
    $permissions->delete($permissionToDelete);
}
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/permissions/).
