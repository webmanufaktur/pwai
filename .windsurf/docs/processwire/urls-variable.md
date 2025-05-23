# $urls

**ProcessWire API Variable**

- [Official Docs](https://processwire.com/api/ref/urls/)

## Overview

The `$urls` API variable provides easy access to commonly used URLs in your ProcessWire site, such as root URLs, admin URLs, and template URLs.

## Usage

```php
// Get the root URL
echo $urls->root;

// Get the admin URL
echo $urls->admin;
```

## Common Properties
- `root`: The root URL of the site.
- `admin`: The admin area URL.
- `templates`: The templates directory URL.
- `files`: The files directory URL.

## Notes
- Useful for generating links and referencing site resources.

## See Also
- [$config](./config-variable.md)
- [ProcessWire URLs Docs](https://processwire.com/api/ref/urls/)
