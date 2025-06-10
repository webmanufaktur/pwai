---
title: Template with Metadata
description: Create a template with label, tags, and description
tags: [template, metadata, rockmigrations]
---

```php
'news' => [
  'fields' => ['title', 'summary', 'body'],
  'label' => 'News Article',
  'tags' => 'Content,News',
  'description' => 'Template for news articles',
],
```

**Options:**
- `label`: Human-readable name
- `tags`: Comma-separated list of tags
- `description`: Detailed description
