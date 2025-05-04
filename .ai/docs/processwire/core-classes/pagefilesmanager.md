# PagefilesManager

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/pagefiles-manager/)

## Overview

`PagefilesManager` provides methods for managing file and image uploads for pages, including moving, copying, and deleting files.

## Usage

```php
$manager = $pages->filesManager;
// Use methods to manage files/images
```

## Common Methods
- `move($src, $dest)`: Move a file.
- `copy($src, $dest)`: Copy a file.
- `delete($file)`: Delete a file.

## See Also
- [Pagefiles](./pagefiles-class.md)
- [Pageimages](./pageimages-class.md)
