# PageArray()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/pagearray/)

## Overview

The `PageArray()` function creates a new PageArray object, which is a collection of Page objects. Used for manipulating and iterating over sets of pages.

## Usage

```php
// Create an empty PageArray
$pa = PageArray();

// Add pages to the array
$pa->add($page);
```

## Common Methods
- `add($page)`: Add a page to the array.
- `find($selector)`: Find pages in the array.
- `get($selector)`: Get a page by selector.

## Notes
- Used extensively for page queries and results.

## See Also
- [PageArray class](https://processwire.com/api/ref/pagearray/)
