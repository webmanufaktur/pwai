---
title: Template with Field Contexts
description: Customize field behavior in different contexts
tags: [template, field-contexts, rockmigrations]
---

```php
'product' => [
  'fields' => ['title', 'price', 'description'],
  'fieldgroupContexts' => [
    'price' => [
      'admin' => [
        'label' => 'Price (Admin)',
        'collapsed' => 2,  // 0=open, 1=closed, 2=closed+hidden
      ],
    ],
  ],
],
```

**Options:**
- `fieldgroupContexts`: Array of field-specific settings
- `admin` context: Settings for admin view
- `collapsed`: Field visibility state (0-4)
- `label`: Custom label for this context
