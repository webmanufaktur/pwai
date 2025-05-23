# Permissions & Roles API

This document covers the `$permissions` and `$roles` API variables in ProcessWire, which are essential for managing access control.

## $permissions API Variable

### Overview
- **Type**: `Permissions`
- **Purpose**: Manage and check user permissions
- **Availability**: Always available in templates and modules

### Basic Usage

#### Getting Permissions
```php
// Get all permissions
$allPermissions = $permissions->find("");

// Get a specific permission
$editPermission = $permissions->get('page-edit');
```

#### Checking Permissions
```php
// Check if current user has a permission
if($user->hasPermission('page-edit')) {
    // User can edit pages
}

// Check multiple permissions
if($user->hasPermission('page-edit', 'page-delete')) {
    // User can edit and delete pages
}
```

#### Creating Permissions
```php
// Create a new permission
$p = new Permission();
$p->name = 'my-permission';
$p->title = 'My Custom Permission';
$p->save();
```

## $roles API Variable

### Overview
- **Type**: `Roles`
- **Purpose**: Manage user roles
- **Availability**: Always available in templates and modules

### Basic Usage

#### Getting Roles
```php
// Get all roles
$allRoles = $roles->find("");

// Get a specific role
$adminRole = $roles->get('admin');
```

#### Working with User Roles
```php
// Add a role to a user
$user->addRole('editor');

// Remove a role from a user
$user->removeRole('editor');

// Check if user has a role
if($user->hasRole('editor')) {
    // User is an editor
}
```

#### Creating Roles
```php
// Create a new role
$r = new Role();
$r->name = 'content-manager';
$r->title = 'Content Manager';
$r->save();

// Add permissions to role
$r->addPermission('page-edit');
$r->addPermission('page-create');
$r->save();
```

## Common Patterns

### Role-Based Access Control
```php
// Check if user has any of these roles
$allowedRoles = ['superuser', 'editor'];
if($user->hasRole($allowedRoles)) {
    // Allow access
}

// Check if user has all required roles
$requiredRoles = ['editor', 'publisher'];
if($user->hasRole($requiredRoles, 'all')) {
    // User has both editor and publisher roles
}
```

### Permission Inheritance
```php
// Check if user has permission through any role
function userCan($user, $permissionName) {
    if($user->isSuperuser()) return true;
    foreach($user->roles as $role) {
        if($role->hasPermission($permissionName)) {
            return true;
        }
    }
    return false;
}
```

## Best Practices

1. **Use Descriptive Names**
   - Prefix permission names with the module name for custom permissions
   - Example: `my-module-edit`

2. **Least Privilege**
   - Assign only necessary permissions to roles
   - Create granular permissions for better control

3. **Document Permissions**
   - Document custom permissions in your module's README
   - Include permission requirements in your module's install() method

## Security Considerations

- Always validate permissions on the server side
- Never rely solely on client-side permission checks
- Use ProcessWire's built-in permission system instead of creating custom solutions
- Regularly audit user roles and permissions
