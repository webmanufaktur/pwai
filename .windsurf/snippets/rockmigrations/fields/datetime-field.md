---
title: Date/Time Field
description: Create a date or datetime field with RockMigrations
tags: [field, date, time, datetime, rockmigrations]
---

```php
'event_date' => [
  'type' => 'datetime',
  'label' => 'Event Date',
  'datepicker' => true,
  'timepicker' => false,
],
```

**Options:**
- `datepicker`: Show date picker (true/false)
- `timepicker`: Show time picker (true/false)
- `dateInputFormat`: Custom date format
- `timeInputFormat`: Custom time format
