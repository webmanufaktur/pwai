# paths()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/paths/)

## Overview

The `paths()` function provides access to common filesystem paths in your ProcessWire installation.

## Usage

```php
// Get the Paths object
$paths = paths();

// Example: get the root path
echo paths()->root;
```

## Common Properties
- `root`: The root filesystem path.
- `templates`: The templates directory path.
- `files`: The files directory path.

## Notes
- Useful for referencing directories on the server.

## See Also
- [$config](./config-variable.md)
