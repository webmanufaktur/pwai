---
title: Options Field
description: Create a select, radio, or checkbox group field with RockMigrations
tags: [field, select, radio, options, rockmigrations]
---

```php
'status' => [
  'type' => 'options',
  'label' => 'Status',
  'options' => [
    1 => 'Active',
    2 => 'Inactive',
    3 => 'Archived',
  ],
  'inputfield' => 'InputfieldRadios', // or InputfieldSelect, InputfieldAsmSelect
],
```

**Input Types:**
- `InputfieldRadios`: Radio buttons
- `InputfieldSelect`: Dropdown select
- `InputfieldAsmSelect`: Multi-select with add/remove
- `InputfieldCheckboxes`: Checkbox group

**Options:**
- `options`: Array of value => label pairs
- `default`: Default selected value
