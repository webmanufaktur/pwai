---
title: Template with Custom Template File
description: Associate a template with a specific PHP template file
tags: [template, file, view, rockmigrations]
---

```php
'landingpage' => [
  'fields' => ['title', 'body', 'hero_image'],
  'filename' => 'landingpage.php', // Relative to /site/templates/
],
```

**Options:**
- `filename`: PHP template file (e.g., 'landingpage.php')
- `altFilename`: Alternate template file for specific contexts
- `pageClass`: Custom PHP class for pages using this template

**Note:** The template file should be placed in `/site/templates/`
