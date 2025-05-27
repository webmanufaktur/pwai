---
title: Template with Restrictions
description: Control child and parent relationships for templates
tags: [template, restrictions, rockmigrations]
---

```php
'event' => [
  'fields' => ['title', 'event_date', 'location'],
  'noChildren' => true,    // No child pages allowed
  'noParents' => false,    // Can have parents
],
```

**Options:**
- `noChildren`: Prevent pages from having children
- `noParents`: Prevent pages from having parents
- `allowPageNum`: Allow pagination
