# RockMigrations Development Guidelines

## Overview

This document outlines the standards and best practices for working with RockMigrations in ProcessWire projects. It serves as a companion to the [RockMigrations Quick Reference](../docs/rockmigrations/rockmigrations_quick_reference.md) and the [snippet library](../snippets/rockmigrations/).

## Core Principles

1. **Version Control First**
   - All database structures should be defined in migration files
   - Never make structural changes directly in the admin interface
   - Each migration should be atomic and reversible when possible

2. **Code Organization**
   - Store migrations in `/site/migrations/`
   - Use timestamp prefixes for migration files (e.g., `202505231500_my_migration.php`)
   - Group related migrations in subdirectories when needed

## Migration File Structure

```php
<?php
/**
 * Brief description of what this migration does
 * 
 * @see Related documentation or ticket reference
 */

// Always get RockMigrations instance
$rm = $this->wire->modules->get('RockMigrations');

// Your migration code here

// Always return a status message
return "Brief description of changes made";
```

## Field Creation

When creating fields:

1. **Use Snippet Library**
   - Reference field snippets in `.windsurf/snippets/rockmigrations/fields/`
   - Each field type has its own file with common configurations

2. **Field Naming**
   - Use snake_case
   - Be descriptive but concise
   - Prefix related fields (e.g., `event_start`, `event_end`)

3. **Common Field Types**
   - Basic: `text`, `textarea`, `integer`, `float`
   - Content: `ckeditor`, `image`, `file`
   - Structure: `page`, `repeater`, `options`

## Template Creation

When creating templates:

1. **Use Snippet Library**
   - Reference template snippets in `.windsurf/snippets/rockmigrations/templates/`
   - Start with basic templates and add features as needed

2. **Template Structure**
   - Define all fields in the template
   - Set appropriate permissions
   - Configure family settings (parents/children)
   - Add metadata (icon, tags, description)

## Best Practices

### 1. Field Management

- Always set labels and descriptions
- Use appropriate input types
- Set required/optional status
- Configure validation rules
- Add help text for content editors

### 2. Template Management

- Set appropriate page class
- Configure URL segments and pagination
- Set up proper family settings
- Add template context help

### 3. Code Style

- Use array syntax for configurations
- Group related settings together
- Add comments for non-obvious configurations
- Keep migrations focused and single-purpose

## Common Patterns

### Field Creation

```php
$rm->migrate([
  'fields' => [
    'my_field' => [
      'type' => 'text',
      'label' => 'My Field',
      'description' => 'Brief description',
      'required' => true,
    ],
  ],
]);
```

### Template Creation

```php
$rm->migrate([
  'templates' => [
    'my_template' => [
      'fields' => ['title', 'my_field'],
      'label' => 'My Template',
      'icon' => 'file-text-o',
    ],
  ],
]);
```

## Debugging

1. **Check Logs**
   ```php
   $log->save('migrations', 'Migration message');
   ```

2. **Dry Run**
   ```php
   $rm->setDryRun(true);
   ```

3. **Debug Mode**
   ```php
   $rm->debug(true);
   ```

## Resources

- [RockMigrations Quick Reference](../docs/rockmigrations/rockmigrations_quick_reference.md)
- [Field Snippets](../snippets/rockmigrations/fields/)
- [Template Snippets](../snippets/rockmigrations/templates/)
- [Official Documentation](https://processwire.com/modules/rock-migrations/)

## Version History

- 2025-05-23: Initial version
