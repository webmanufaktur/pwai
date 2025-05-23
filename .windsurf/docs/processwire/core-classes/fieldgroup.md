# Fieldgroup Class

The Fieldgroup class represents a collection of fields that are used by a template in ProcessWire.

## Overview

Fieldgroups in ProcessWire are collections of fields that are assigned to templates. Each template has exactly one fieldgroup, which defines what fields are available to pages using that template. Fieldgroups can be shared among multiple templates, allowing for consistent data structures throughout a site.

## Common Properties

- `$fieldgroup->id` - The fieldgroup's ID
- `$fieldgroup->name` - The fieldgroup's name
- `$fieldgroup->fields` - The fields in the fieldgroup
- `$fieldgroup->contexts` - The contexts for fields in the fieldgroup
- `$fieldgroup->template` - The template that uses this fieldgroup

## Common Methods

- `$fieldgroup->add($field)` - Add a field to the fieldgroup
- `$fieldgroup->remove($field)` - Remove a field from the fieldgroup
- `$fieldgroup->append($field)` - Append a field to the fieldgroup
- `$fieldgroup->prepend($field)` - Prepend a field to the fieldgroup
- `$fieldgroup->insertBefore($field, $existingField)` - Insert a field before another field
- `$fieldgroup->insertAfter($field, $existingField)` - Insert a field after another field
- `$fieldgroup->has($field)` - Check if the fieldgroup has a field
- `$fieldgroup->hasField($field)` - Check if the fieldgroup has a field
- `$fieldgroup->hasFieldContext($field)` - Check if the fieldgroup has a context for a field
- `$fieldgroup->getField($field)` - Get a field from the fieldgroup
- `$fieldgroup->getFieldContext($field)` - Get the context for a field in the fieldgroup
- `$fieldgroup->getFields()` - Get all fields in the fieldgroup
- `$fieldgroup->getFieldContexts()` - Get all field contexts in the fieldgroup
- `$fieldgroup->getFieldIDs()` - Get the IDs of all fields in the fieldgroup
- `$fieldgroup->getFieldNames()` - Get the names of all fields in the fieldgroup
- `$fieldgroup->getTemplates()` - Get all templates that use this fieldgroup
- `$fieldgroup->getNumTemplates()` - Get the number of templates that use this fieldgroup
- `$fieldgroup->saveContext($field)` - Save the context for a field in the fieldgroup
- `$fieldgroup->sort($field, $before = null)` - Sort a field in the fieldgroup
- `$fieldgroup->setFieldContextArray($field, array $data)` - Set the context array for a field in the fieldgroup
- `$fieldgroup->getFieldContextArray($field)` - Get the context array for a field in the fieldgroup
- `$fieldgroup->fieldContexts($field = null)` - Get or set field contexts
- `$fieldgroup->isValid($field)` - Check if a field is valid for this fieldgroup
- `$fieldgroup->isValidSystemField($field)` - Check if a field is a valid system field
- `$fieldgroup->isValidNativeField($field)` - Check if a field is a valid native field
- `$fieldgroup->isValidCustomField($field)` - Check if a field is a valid custom field
- `$fieldgroup->isDeleteable()` - Check if the fieldgroup is deleteable

## Usage Examples

### Creating a Fieldgroup

```php
// Create a new fieldgroup
$fieldgroup = new Fieldgroup();
$fieldgroup->name = 'my-fieldgroup';

// Add fields to the fieldgroup
$fieldgroup->add($fields->get('title'));
$fieldgroup->add($fields->get('body'));
$fieldgroup->add($fields->get('images'));

// Save the fieldgroup
$fieldgroups->save($fieldgroup);
```

### Modifying a Fieldgroup

```php
// Get an existing fieldgroup
$fieldgroup = $fieldgroups->get('basic-page');

// Add a field to the fieldgroup
$fieldgroup->add($fields->get('my_field'));

// Remove a field from the fieldgroup
$fieldgroup->remove($fields->get('body'));

// Insert a field before another field
$fieldgroup->insertBefore($fields->get('my_field'), $fields->get('title'));

// Insert a field after another field
$fieldgroup->insertAfter($fields->get('my_field'), $fields->get('title'));

// Save the fieldgroup
$fieldgroups->save($fieldgroup);
```

### Working with Field Contexts

```php
// Get a fieldgroup and a field
$fieldgroup = $fieldgroups->get('basic-page');
$field = $fields->get('my_field');

// Get the context for the field in the fieldgroup
$context = $fieldgroup->getFieldContext($field);

// Modify the context
$context->label = 'My Field (Basic Page)';
$context->description = 'This field is used in the Basic Page template';
$context->required = true;
$context->collapsed = Field::collapsedYes;
$context->columnWidth = 100;

// Save the context
$fieldgroup->saveContext($field);
```

### Checking Fieldgroup Properties

```php
// Get a fieldgroup
$fieldgroup = $fieldgroups->get('basic-page');

// Check if the fieldgroup has a field
if($fieldgroup->has('title')) {
    // Fieldgroup has the title field
}

// Check if the fieldgroup has a context for a field
if($fieldgroup->hasFieldContext('my_field')) {
    // Fieldgroup has a context for my_field
}

// Get all fields in the fieldgroup
$fields = $fieldgroup->getFields();

// Get all templates that use this fieldgroup
$templates = $fieldgroup->getTemplates();

// Check if the fieldgroup is deleteable
if($fieldgroup->isDeleteable()) {
    // Fieldgroup is deleteable
}
```

## Additional Information

Fieldgroups are a fundamental part of ProcessWire's content management system. They define what fields are available to pages using a particular template, and they can be shared among multiple templates. Understanding how to work with fieldgroups is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/fieldgroup/).
