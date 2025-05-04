# Fields & Templates

This section covers working with fields and templates in ProcessWire.

## Field Class

Represents a field in ProcessWire.

### Key Properties
- `name` - Field name
- `type` - Field type
- `label` - Field label
- `description` - Field description
- `required` - Is field required?

### Key Methods
- `getInputfield(Page $page)` - Get input field for form
- `getDatabaseSchema()` - Get database schema

## Template Class

Represents a template in ProcessWire.

### Key Properties
- `name` - Template name
- `label` - Template label
- `fieldgroup` - Associated fields
- `cache_time` - Cache time in seconds

### Key Methods
- `getFields()` - Get all fields
- `hasField($field)` - Check if template has field
- `fieldgroupHasField($field)` - Check if field exists

## Common Patterns

### Working with Fields
```php
// Get field
$field = $fields->get('title');

// Get all fields
$allFields = $fields->find("sort=name");

// Create new field
$f = new Field();
$f->type = 'FieldtypeText';
$f->name = 'my_field';
$f->label = 'My Field';
$f->save();

// Add field to template
$template->fieldgroup->add($f);
$template->fieldgroup->save();
```

### Working with Templates
```php
// Get template
$template = $templates->get('basic-page');

// Create new template
$t = new Template();
$t->name = 'product';
$t->label = 'Product';
$t->save();

// Set template family settings
$t->noChildren = 0; // Allow children
$t->childTemplates = []; // Allowed child templates
$t->save();
```

### Field Types

#### Text
```php
$f = new Field();
$f->type = 'FieldtypeText';
$f->name = 'headline';
$f->label = 'Headline';
$f->save();
```

#### Textarea
```php
$f = new Field();
$f->type = 'FieldtypeTextarea';
$f->name = 'body';
$f->label = 'Body';
$f->contentType = FieldtypeTextarea::contentTypeHTML;
$f->save();
```

#### Image
```php
$f = new Field();
$f->type = 'FieldtypeImage';
$f->name = 'images';
$f->label = 'Images';
$f->maxFiles = 5;
$f->save();
```

#### Page Reference
```php
$f = new Field();
$f->type = 'FieldtypePage';
$f->name = 'related_products';
$f->label = 'Related Products';
$f->derefAsPage = 1;
$f->inputfield = 'InputfieldPage';
$f->parent_id = $pages->get('/products/')->id;
$f->save();
```

## Template Hierarchy

ProcessWire allows you to create template hierarchies:

```
basic-page (template)
└── blog-post (template)
    └── news-article (template)
```

Inheritance can be handled in templates:

```php
// blog-post.php
echo $page->title;
echo $page->body;

// news-article.php
include('./blog-post.php'); // Include parent template
echo $page->author; // Additional fields
```

## Best Practices

1. **Use Descriptive Names**
   - Use lowercase with hyphens for template names
   - Be consistent with field naming

2. **Field Organization**
   - Group related fields together
   - Use fieldset tabs for better organization

3. **Template Organization**
   - Create a logical template hierarchy
   - Use template inheritance where appropriate

4. **Performance**
   - Only load fields that are needed
   - Use field selectors to limit data
   - Consider using template caching for complex pages
