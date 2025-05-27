---
title: Page Reference Field
description: Create a field that references other pages with RockMigrations
tags: [field, page, reference, rockmigrations]
---

```php
'author' => [
  'type' => 'page',
  'label' => 'Author',
  'template' => 'user',
  'parent' => '/users/',
  'inputfield' => 'InputfieldSelect',
  'derefAsPage' => 1,
],
```

**Options:**
- `template`: Template of pages that can be selected
- `parent`: Parent page path for selectable pages
- `inputfield`: Input field type (Select, Radios, etc.)
- `derefAsPage`: Return Page object (1) or PageArray (0)
