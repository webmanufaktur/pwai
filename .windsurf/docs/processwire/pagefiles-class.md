# Pagefiles

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/pagefiles/)

## Overview

`Pagefiles` represents a collection of files attached to a Page field. Used for managing multiple file uploads.

## Usage

```php
foreach($page->files as $file) {
    // $file is a Pagefile object
}
```

## Common Methods
- `add($file)`: Add a file.
- `delete($file)`: Remove a file.

## See Also
- [Pagefile](./pagefile-class.md)
