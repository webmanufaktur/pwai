# urls()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/urls/)

## Overview

The `urls()` function provides access to common URLs in your ProcessWire site, such as root, admin, and template URLs.

## Usage

```php
// Get the URLs object
$urls = urls();

// Example: get the root URL
echo urls()->root;
```

## Common Properties
- `root`: The root URL of the site.
- `admin`: The admin area URL.
- `templates`: The templates directory URL.

## Notes
- Equivalent to using the `$urls` API variable.

## See Also
- [$urls](./urls-variable.md)
