# files()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/files/)

## Overview

The `files()` function provides access to the Files API, used for managing file assets in ProcessWire.

## Usage

```php
// Get the Files object
$files = files();

// Example: get file path
echo files()->path($page, 'myfile.txt');
```

## Common Methods
- `path($page, $filename)`: Get the file path.
- `url($page, $filename)`: Get the file URL.

## Notes
- Equivalent to using the `$files` API variable.

## See Also
- [$files](./files-variable.md)
