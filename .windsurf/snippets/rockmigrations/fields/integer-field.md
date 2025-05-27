---
title: Integer Field
description: Create an integer/number field with RockMigrations
tags: [field, integer, number, rockmigrations]
---

```php
'order' => [
  'type' => 'integer',
  'label' => 'Order',
  'min' => 0,
  'max' => 100,
],
```

**Options:**
- `min`: Minimum allowed value
- `max`: Maximum allowed value
- `step`: Interval between valid values (default: 1)
