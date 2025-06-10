---
title: Template with URL Settings
description: Configure URL segments and pagination
tags: [template, url, pagination, rockmigrations]
---

```php
'blog' => [
  'fields' => ['title', 'body', 'author'],
  'urlSegments' => true,    // Allow URL segments (/blog/foo/)
  'allowPageNum' => true,  // Allow pagination (/blog/page2/)
],
```

**Options:**
- `urlSegments`: Enable URL segments (true/false)
- `allowPageNum`: Enable pagination (true/false)
- `slashUrls`: Whether to use trailing slashes in URLs
