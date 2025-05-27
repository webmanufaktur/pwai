---
title: Template with Family Settings
description: Control parent/child relationships and allowed templates
tags: [template, family, children, rockmigrations]
---

```php
'category' => [
  'fields' => ['title', 'description'],
  'family' => [
    'allowedTemplates' => ['product'], // Only products allowed as children
    'parentTemplates' => ['home'],     // Only allowed under "home"
    'maxChildren' => 10,               // Maximum 10 child pages
  ],
],
```

**Family Options:**
- `allowedTemplates`: Templates that can be children
- `parentTemplates`: Templates that can be parents
- `maxChildren`: Maximum number of children allowed
- `allowPageNum`: Allow pagination of children
