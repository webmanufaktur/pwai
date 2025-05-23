# Paths

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/paths/)

## Overview

`Paths` provides access to common filesystem paths in ProcessWire, such as root, templates, and files directories.

## Usage

```php
$paths = $config->paths;
echo $paths->root;
```

## Common Properties
- `root`: The root filesystem path.
- `templates`: The templates directory path.
- `files`: The files directory path.

## See Also
- [$config](./config-variable.md)
- [Paths Docs](https://processwire.com/api/ref/paths/)
