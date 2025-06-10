# Pagefile

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/pagefile/)

## Overview

`Pagefile` represents a single file (not image) attached to a Page field. Used for managing file uploads and file metadata.

## Usage

```php
foreach($page->files as $file) {
    echo $file->url;
}
```

## Common Properties
- `url`: The URL to the file.
- `filename`: The full path to the file.

## See Also
- [Pagefiles](./pagefiles-class.md)
