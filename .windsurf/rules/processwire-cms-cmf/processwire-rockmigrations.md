---
trigger: glob
globs: site/templates/migrations.php
---

# RockMigrations & Templates and fields

- to create new templates and fields, use RockMigrations
- when tagging templates and fields, use a string value
- .vscode contains helper functions for creating templates and fields
  - [RockMigration Snippets](../.vscode/RockMigrations.code-snippets)
  - [ProcessWire Snippets](../.vscode/ProcessWire.code-snippets)

## RockMigrations Code Samples

### Create field

```php
$migrate->createField('field-name', 'field-type', [
  'label' => 'Field name',
  'description' => 'Field description',
  'required' => true,
  'default' => 'default value',
  'options' => [
    'option1' => 'Option 1',
    'option2' => 'Option 2',
  ],
]);
```

### Create template

```php
$migrate->createTemplate('template-name');
```
### Create template and assign label, tags, icon, and fields

```php
$migrate->createTemplate('template-name', [
  'label' => 'Template name',
  'fields-' => ['title', 'field1', 'field2', 'field3'],
  'tags' => 'tag1 tag2 tag3',
  'pageLabelField' => 'fa-icon-name title',
]);
```

### Update template data

```php
$migrate->setTemplateData('template-name', [
  'fields' => ['title', 'field1', 'field2', 'field3'],
]);
```

### Delete template

```php
$migrate->deleteTemplate('template-name');
```


More examples in [VS Code Snippets - RockMigrations](/.vscode/RockMigrations.code-snippets)
