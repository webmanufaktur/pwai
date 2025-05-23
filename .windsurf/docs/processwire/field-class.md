# Field Class

The Field class represents a single field in ProcessWire, defining how data is stored and manipulated.

## Overview

Fields in ProcessWire are the building blocks for templates. Each field has a specific type (Fieldtype) that determines how its data is stored and manipulated. Fields can be shared across multiple templates, allowing for consistent data structures throughout a site.

## Common Properties

- `$field->id` - The field's ID
- `$field->name` - The field's name (used in API calls)
- `$field->label` - The field's label (shown in the admin)
- `$field->description` - The field's description
- `$field->type` - The field's type (Fieldtype)
- `$field->required` - Whether the field is required
- `$field->collapsed` - The field's collapsed state in the admin
- `$field->flags` - The field's flags
- `$field->tags` - Tags associated with the field
- `$field->icon` - Icon associated with the field
- `$field->showIf` - Conditions for showing the field
- `$field->columnWidth` - Width of the field's column in the admin
- `$field->useRoles` - Whether the field uses role-based access control
- `$field->editRoles` - Roles that can edit the field
- `$field->viewRoles` - Roles that can view the field

## Common Methods

- `$field->getInputfield(Page $page, $contextStr = '')` - Get the inputfield for this field
- `$field->getCompatibleFieldtypes()` - Get fieldtypes compatible with this field
- `$field->getFieldgroups()` - Get fieldgroups that use this field
- `$field->getTemplates()` - Get templates that use this field
- `$field->getPages($selector = '')` - Get pages that use this field
- `$field->getTabField()` - Get the tab field for this field
- `$field->getFieldgroup()` - Get the fieldgroup for this field
- `$field->getContext($fieldgroup)` - Get the context for this field in a fieldgroup
- `$field->getContexts()` - Get all contexts for this field
- `$field->saveContext($fieldgroup)` - Save the context for this field in a fieldgroup
- `$field->hasContext($fieldgroup)` - Check if this field has a context in a fieldgroup
- `$field->setContext($fieldgroup)` - Set the context for this field in a fieldgroup
- `$field->type()` - Get or set the field's type
- `$field->prevTable()` - Get the previous database table for this field
- `$field->prevFieldtype()` - Get the previous fieldtype for this field
- `$field->prevTemplates()` - Get the previous templates for this field
- `$field->isChanged($what)` - Check if the field has changed
- `$field->isAutoload()` - Check if the field is autoloaded
- `$field->isGlobal()` - Check if the field is global
- `$field->isNative()` - Check if the field is native
- `$field->isSystem()` - Check if the field is a system field
- `$field->isFieldtypeFile()` - Check if the field is a file field
- `$field->isInFieldgroup($fieldgroup)` - Check if the field is in a fieldgroup
- `$field->isInTemplate($template)` - Check if the field is in a template
- `$field->isNew()` - Check if the field is new
- `$field->isSaveable()` - Check if the field is saveable
- `$field->isTrackable()` - Check if the field is trackable
- `$field->isUsableInContext($fieldgroup)` - Check if the field is usable in a context
- `$field->isDeleteable()` - Check if the field is deleteable

## Usage Examples

### Creating a Field

```php
// Create a new field
$field = new Field();
$field->name = 'my_field';
$field->label = 'My Field';
$field->type = $modules->get('FieldtypeText');
$field->description = 'This is my custom field';
$field->required = true;
$field->collapsed = Field::collapsedNever;
$field->tags = 'custom, text';
$field->icon = 'file-text-o';
$field->columnWidth = 50;

// Save the field
$fields->save($field);
```

### Modifying a Field

```php
// Get an existing field
$field = $fields->get('my_field');

// Modify the field
$field->label = 'My Modified Field';
$field->description = 'This field has been modified';
$field->required = false;

// Save the field
$fields->save($field);
```

### Working with Field Contexts

```php
// Get a field and a fieldgroup
$field = $fields->get('my_field');
$fieldgroup = $fieldgroups->get('basic-page');

// Get the context for the field in the fieldgroup
$context = $field->getContext($fieldgroup);

// Modify the context
$context->label = 'My Field (Basic Page)';
$context->description = 'This field is used in the Basic Page template';
$context->required = true;
$context->collapsed = Field::collapsedYes;
$context->columnWidth = 100;

// Save the context
$field->saveContext($fieldgroup);
```

### Checking Field Properties

```php
// Get a field
$field = $fields->get('my_field');

// Check if the field is required
if($field->required) {
    // Field is required
}

// Check if the field is in a template
if($field->isInTemplate('basic-page')) {
    // Field is in the basic-page template
}

// Check if the field is a system field
if($field->isSystem()) {
    // Field is a system field
}

// Check if the field is a file field
if($field->isFieldtypeFile()) {
    // Field is a file field
}
```

## Additional Information

Fields are a fundamental part of ProcessWire's content management system. They define how data is stored and manipulated, and they can be shared across multiple templates. Understanding how to work with fields is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/field/).
