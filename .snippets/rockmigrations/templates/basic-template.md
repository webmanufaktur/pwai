---
title: Basic Template
description: Create a simple template with fields
tags: [template, basic, rockmigrations]
---

```php
'my_template' => [
  'fields' => ['title', 'body', 'gallery'],
],
```

**Options:**
- `fields`: Array of field names to include
- `label`: Human-readable name (defaults to template name)
- `tags`: For grouping related templates
