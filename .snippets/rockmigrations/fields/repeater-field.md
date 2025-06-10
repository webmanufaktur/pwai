---
title: Repeater Field
description: Create a repeater field with RockMigrations
tags: [field, repeater, rockmigrations]
---

```php
// First define the fields for the repeater:
'repeater_title' => [
  'type' => 'text',
  'label' => 'Repeater Title',
  'tags' => 'RepeaterExample',
],

// Then create the repeater field:
'my_repeater' => [
  'type' => 'repeater',
  'label' => 'My Repeater',
  'repeaterFields' => ['repeater_title', 'another_field'],
  'repeaterTitle' => '#n: {repeater_title}',
],
```

**Options:**
- `repeaterFields`: Array of field names to include
- `repeaterTitle`: Title format for each item
- `tags`: For grouping related fields
