# $users API variable / Users class

Manages all users (User objects) in ProcessWire.

In addition to those shown below, the Users class also inherits all the methods and properties of: PagesType and Wire.

## Common Methods

- `$users->add($name)` - Add a new user with the given name. Returns a User.
- `$users->count($selector = '')` - Count the number of users matching the given selector. Returns an integer.
- `$users->delete(User $user)` - Delete a user. Returns a boolean.
- `$users->find($selector = '')` - Find users matching the given selector. Returns a PageArray of User objects.
- `$users->get($selector)` - Get a single user by the given selector. Returns a User or NullPage.
- `$users->getCurrentUser()` - Get the current user. Returns a User.
- `$users->getGuestUser()` - Get the guest user. Returns a User.
- `$users->save(User $user)` - Save a user. Returns a boolean.

## For Hooks Methods

- `$users->added(User $user)` - Hook called after a user is added.
- `$users->deleted(User $user)` - Hook called after a user is deleted.
- `$users->saved(User $user)` - Hook called after a user is saved.

## Usage Examples

```php
// Get a user by name
$user = $users->get('admin');

// Get a user by ID
$user = $users->get(42);

// Find users with a specific role
$editors = $users->find('roles=editor');

// Count users with a specific role
$count = $users->count('roles=editor');

// Add a new user
$newUser = $users->add('newuser');
$newUser->pass = 'password123';
$newUser->email = 'newuser@example.com';
$newUser->addRole('editor');
$users->save($newUser);

// Delete a user
$userToDelete = $users->get('username=userToDelete');
if($userToDelete->id) {
    $users->delete($userToDelete);
}
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/users/).
