---
title: Textarea Field
description: Create a textarea field with RockMigrations
tags: [field, textarea, rockmigrations]
---

```php
'description' => [
  'type' => 'textarea',
  'label' => 'Description',
  'rows' => 5,
  'inputfieldClass' => 'InputfieldTextarea',
],
```

**Options:**
- `rows`: Number of visible text lines
- `inputfieldClass`: The input field class to use
- `contentType`: For HTML content, use `FieldtypeTextarea::contentTypeHTML`
