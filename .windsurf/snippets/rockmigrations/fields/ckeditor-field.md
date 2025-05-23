---
title: CKEditor Field
description: Create a rich text editor field with RockMigrations
tags: [field, ckeditor, richtext, rockmigrations]
---

```php
'body' => [
  'type' => 'textarea',
  'inputfieldClass' => 'InputfieldCKEditor',
  'label' => 'Body Text',
  'contentType' => FieldtypeTextarea::contentTypeHTML,
],
```

**Notes:**
- Requires CKEditor module to be installed
- `contentType` must be set to `FieldtypeTextarea::contentTypeHTML` for proper HTML handling
