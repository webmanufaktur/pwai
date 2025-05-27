# RockMigrations ProcessWire Documentation - Quick Reference

## Basics

RockMigrations is a module that enables the creation and management of ProcessWire structures through code. It allows:

- Automated creation of fields, templates, and pages
- Version control for site structures
- Synchronization between development environments

## Basic Usage

```php
wire('modules')->get('RockMigrations');

// Basic migration with arrays
$rm->migrate([
  'fields' => [
    'my_field' => [
      'type' => 'text',       // Field type
      'label' => 'My Field',  // Label
      'tags' => 'MyGroup',    // For grouping
      // Additional properties based on field type
    ],
  ],
  'templates' => [
    'my_template' => [
      'fields' => ['title', 'my_field'],
      'tags' => 'MyGroup',
      // Template options
    ],
  ],
  'pages' => [
    'my-page' => [
      'template' => 'my_template',
      'parent' => '/',
      'title' => 'My Page',
      // Additional page properties
    ],
  ],
]);
```

## Field Types and Properties

### General Field Properties

- `type`: Field type (text, textarea, page, image, etc.)
- `label`: Display name in admin
- `description`: Description text
- `required`: Required field (true/false)
- `tags`: Grouping or categorization
- `collapsed`: Collapsed state (0-4, 0=open, 4=invisible)

### Specific Field Types

#### Text/Textarea

```php
'my_text' => [
  'type' => 'text',
  'maxlength' => 255,
],
'my_textarea' => [
  'type' => 'textarea',
  'inputfieldClass' => 'InputfieldCKEditor',
  'contentType' => FieldtypeTextarea::contentTypeHTML,
],
```

#### Select/Options

```php
'my_select' => [
  'type' => 'options',
  'options' => [
    'option1|Option 1',
    'option2|Option 2',
  ],
],
```

#### Image/File

```php
'my_image' => [
  'type' => 'image',
  'maxFiles' => 0,      // 0 = unlimited
  'extensions' => 'jpg jpeg png',
  'maxSize' => 3,       // max 3 megapixels
  'outputFormat' => 0,  // 0 = multiple, 1 = single, 2 = array
],
```

#### Page Reference

```php
'my_pages' => [
  'type' => 'page',
  'template' => 'my_template', // Templates of selectable pages
  'parent' => '/my-section/',  // Parent path of selectable pages
  'labelFieldName' => 'title',   // Field for display
  'derefAsPage' => 0,            // 0 = PageArray, 1 = Page
  'inputfield' => 'InputfieldSelect', // or 'InputfieldAsmSelect', etc.
],
```

#### Repeater/RepeaterMatrix

```php
// First define repeater fields
'repeater_text' => ['type' => 'text', 'tags' => 'MyRepeater'],

// Then the repeater field
'my_repeater' => [
  'type' => 'repeater',
  'repeaterFields' => ['repeater_text', 'another_field'],
  'repeaterTitle' => '#n: {repeater_text}', // Display format
],

// RepeaterMatrix example
'my_matrix' => [
  'type' => 'RepeaterMatrix',
  'repeaterAddLabel' => 'Add element',
  'matrix' => [
    'type1' => [
      'label' => 'Type 1',
      'fields' => ['field1', 'field2'],
    ],
    'type2' => [
      'label' => 'Type 2',
      'fields' => ['field3', 'field4'],
    ],
  ],
],
```

## Templates

```php
'my_template' => [
  'fields' => ['title', 'my_field', 'my_repeater'],
  'label' => 'My Template',
  'tags' => 'MyGroup',
  'noChildren' => true,           // No child pages allowed
  'noParents' => true,            // No parent pages allowed
  'allowPageNum' => true,         // Allow pagination
  'allowChangeUser' => true,      // Allow owner change
  'urlSegments' => true,          // Allow URL segments
  'icon' => 'file-o',             // FontAwesome icon
  'fieldgroupContexts' => [       // Field contexts for different views
    'my_field' => [
      'admin' => [                // "admin" context
        'label' => 'Admin Label', // Different label in admin
        'collapsed' => 2,         // Collapsed in admin
      ],
    ],
  ],
],
```

## Pages

```php
'my-page' => [
  'template' => 'my_template',
  'name' => 'my-page',           // URL name
  'title' => 'My Page',          // Title
  'parent' => '/',               // Parent path
  'status' => 'hidden',          // Status (hidden, unpublished, etc.)
  'fields' => [                  // Field values
    'my_field' => 'Value',
    'my_repeater' => [           // Repeater values
      ['repeater_text' => 'Item 1'],
      ['repeater_text' => 'Item 2'],
    ],
  ],
  'children' => [                // Child pages
    'subpage' => [
      'template' => 'my_template',
      'title' => 'Subpage',
    ],
  ],
],
```

## Advanced Features

### Direct Methods

```php
// Create/update field
$rm->createField('my_field', 'text', [
  'label' => 'My Field',
  // additional options
]);

// Create/update template
$rm->createTemplate('my_template', [
  'field1', 'field2'
], [
  'label' => 'My Template',
  // additional options
]);

// Create/update page
$rm->createPage('my-template', '/', 'My Page', [
  'name' => 'my-page',
  'fields' => [
    'my_field' => 'Value',
  ],
]);
```

### Field Group Context Functions

```php
$rm->setFieldgroupContexts('my_template', [
  'my_field' => [
    'admin' => [
      'label' => 'Different Label',
      'collapsed' => 1,
    ],
  ],
]);
```

### Install/Configure Modules

```php
$rm->installModule('ModuleName', [
  'option1' => 'value1',
  'option2' => 'value2',
]);
```

### Hook Management

```php
$rm->addHookAfter('Pages::saved', function(HookEvent $event) {
  $page = $event->arguments(0);
  // Hook code
});
```

### Permissions

```php
$rm->createPermission('my-permission', 'My Permission');
$rm->addPermissionToRole('my-permission', 'editor');
```

## Migration Files

Migration files can be stored in modules:

- `/site/modules/MyModule/migrations/migration1.php`

Or directly in the site directory:

- `/site/migrations/migration1.php`

The migration will be executed automatically.
