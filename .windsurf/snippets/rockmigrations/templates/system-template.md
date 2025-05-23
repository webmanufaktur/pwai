---
title: System Template
description: Create a system template with restricted permissions
tags: [template, system, restricted, rockmigrations]
---

```php
'system' => [
  'fields' => ['title', 'body'],
  'system' => true,           // System template (not deletable)
  'noDelete' => true,         // Pages can't be deleted
  'noChangeTemplate' => true, // Template can't be changed
  'noChildren' => true,       // No child pages allowed
],
```

**Restrictions:**
- `system`: Protected system template
- `noDelete`: Prevent page deletion
- `noChangeTemplate`: Lock template assignment
- `noChildren`: Disable child pages
- `noMove`: Prevent page movement
