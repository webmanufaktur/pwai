---
title: Float Field
description: Create a decimal number field with RockMigrations
tags: [field, float, decimal, number, rockmigrations]
---

```php
'price' => [
  'type' => 'float',
  'label' => 'Price',
  'min' => 0,
  'step' => 0.01,
],
```

**Options:**
- `min`: Minimum allowed value
- `max`: Maximum allowed value
- `step`: Interval between valid values (e.g., 0.01 for currency)
