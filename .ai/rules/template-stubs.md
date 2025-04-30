b# Template Stubs Validation Rules

This document outlines the rules and guidelines for maintaining template stubs in the `site/templates/AutoTemplateStubs/` directory.

## File Structure

1. Each template stub must be a PHP file with the following naming convention: `tpl_[template-name].php`
2. The file must contain a properly documented class that extends `ProcessWire\TemplateFile`
3. The class name must match the template name in PascalCase (e.g., `tpl_restaurant.php` → `tpl_restaurant`)

## Documentation Requirements

1. **Class DocBlock**

   - Must include `@template` annotation with template name and description
   - Must list all template fields with `@property` annotations
   - Each `@property` must include:
     - Field type (e.g., `string`, `int`, `Page`, `PageArray`, `Pageimage`, `Pageimages`)
     - Field name (must match the actual field name in ProcessWire)
     - Description of the field's purpose

2. **Field Type Guidelines**
   - Use specific ProcessWire types when applicable:
     - `Page` for single page references
     - `PageArray` for multiple page references
     - `Pageimage` for single images
     - `Pageimages` for multiple images
     - `Pagefiles` for file collections
     - `SelectableOptionArray` for multi-select fields
   - For custom field types, use the most appropriate PHP type (e.g., `string`, `int`, `bool`)
   - For fields that can be multiple types, separate with `|` (e.g., `Page|false`)

## Validation Checks

When reviewing or creating template stubs, verify the following:

1. All fields used in the template are properly documented
2. Field types accurately reflect their ProcessWire field type
3. Descriptions are clear and concise
4. Required fields are marked as such
5. Default values are documented where applicable
6. Field names match exactly with ProcessWire field names

## Example

```php
<?php namespace ProcessWire;

/**
 * @template restaurant (Restaurant)
 * @property int $isPremium Premium status
 * @property string $title Restaurant name
 * @property PageArray $services Available services
 * @property Page|false $priceRange Price category
 * @property Pageimages $images Gallery images
 */
class tpl_restaurant extends TemplateFile {
    // Template logic here
}
```

## Best Practices

1. Keep field documentation in sync with ProcessWire field definitions
2. Update documentation when fields are added, removed, or modified
3. Use descriptive names and clear explanations for each field
4. Group related fields together in the documentation
5. Mark deprecated fields with `@deprecated` when applicable
