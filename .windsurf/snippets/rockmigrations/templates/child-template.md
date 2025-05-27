---
title: Child Template with Specific Parent
description: Create a template that can only be used under specific parent pages
tags: [template, parent, child, rockmigrations]
---

```php
'faq' => [
  'fields' => ['title', 'answer', 'category'],
  'parent' => '/faqs/', // Only allow under /faqs/
  'noParents' => true,  // Can't be created elsewhere
],
```

**Options:**
- `parent`: Parent page path (e.g., '/faqs/')
- `noParents`: Prevent creation outside specified parent
- `childTemplates`: Allowed child templates
- `childNameFormat`: Naming format for auto-created children
