---
title: Template with Admin Settings
description: Customize template appearance in admin
tags: [template, admin, settings, rockmigrations]
---

```php
'project' => [
  'fields' => ['title', 'client', 'description'],
  'icon' => 'briefcase', // FontAwesome icon
  'sortfield' => 'sort', // Default sort field
  'allowChangeUser' => true, // Allow owner change
],
```

**Options:**
- `icon`: FontAwesome icon name
- `sortfield`: Default field to sort by
- `allowChangeUser`: Allow changing page owner
- `sort`: Default sort order (e.g., 'sort' or '-created')
