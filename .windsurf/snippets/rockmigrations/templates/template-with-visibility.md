---
title: Template with Visibility Settings
description: Control template visibility and access
tags: [template, visibility, access, rockmigrations]
---

```php
'private_page' => [
  'fields' => ['title', 'body'],
  'status' => Page::statusHidden, // Hidden by default
  'useRoles' => ['editor', 'superuser'], // Restrict to roles
],
```

**Options:**
- `status`: Default page status (hidden, unpublished, etc.)
- `useRoles`: Array of role names that can use this template
- `noShortcut`: Don't show in "Add New" menu
