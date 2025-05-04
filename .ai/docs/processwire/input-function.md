# input()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/input/)

## Overview

The `input()` function provides access to user input (GET, POST, COOKIE, etc.) in ProcessWire.

## Usage

```php
// Get the Input object
$input = input();

// Access GET or POST variables
$value = input()->get->myvar;
```

## Common Properties
- `get`: GET variables
- `post`: POST variables
- `cookie`: COOKIE variables

## Notes
- Equivalent to using the `$input` API variable.

## See Also
- [$input](./input-variable.md)
