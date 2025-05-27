---
title: File Field
description: Create a file upload field with RockMigrations
tags: [field, file, upload, rockmigrations]
---

```php
'pdf' => [
  'type' => 'file',
  'label' => 'PDF Document',
  'maxFiles' => 1,
  'extensions' => 'pdf',
],
```

**Options:**
- `maxFiles`: Maximum number of files (0 = unlimited)
- `extensions`: Allowed file extensions
- `maxSize`: Maximum file size in MB
- `description`: Help text shown below the field
