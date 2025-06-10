---
title: Image Field
description: Create an image upload field with RockMigrations
tags: [field, image, upload, rockmigrations]
---

```php
'gallery' => [
  'type' => 'image',
  'label' => 'Gallery',
  'maxFiles' => 5,
  'extensions' => 'jpg jpeg png',
  'maxSize' => 5, // in MB
],
```

**Options:**
- `maxFiles`: Maximum number of files (0 = unlimited)
- `extensions`: Allowed file extensions
- `maxSize`: Maximum file size in MB
- `outputFormat`: 0 = multiple, 1 = single, 2 = array
