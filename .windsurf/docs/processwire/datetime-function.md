# datetime()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/datetime/)

## Overview

The `datetime()` function provides access to ProcessWire's DateTime tools for formatting and manipulating dates and times.

## Usage

```php
// Get the DateTime object
$dt = datetime();

// Format a date
echo datetime()->date('Y-m-d H:i:s');
```

## Common Methods
- `date($format, $timestamp = null)`: Format a date.
- `strtotime($string)`: Parse a date/time string.

## Notes
- Equivalent to using the `$datetime` API variable.

## See Also
- [$datetime](./datetime-variable.md)
