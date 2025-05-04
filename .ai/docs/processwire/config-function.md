# config()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/config/)

## Overview

The `config()` function returns the site configuration object, allowing you to access configuration settings programmatically.

## Usage

```php
// Get the Config object
$config = config();

// Access a config property
echo config()->urls->root;
```

## Common Properties
- `urls`: Common URLs.
- `paths`: Common paths.
- `debug`: Debug mode status.

## Notes
- Equivalent to using the `$config` API variable.

## See Also
- [$config](./config-variable.md)
