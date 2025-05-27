---
title: Text Field
description: Create a basic text field with RockMigrations
tags: [field, text, rockmigrations]
---

```php
'title' => [
  'type' => 'text',
  'label' => 'Title',
  'required' => true,
  'maxlength' => 255,
],
```

**Options:**
- `label`: The display name in the admin
- `required`: Whether the field is required (true/false)
- `maxlength`: Maximum number of characters allowed
- `tags`: For grouping related fields
- `description`: Help text shown below the field
