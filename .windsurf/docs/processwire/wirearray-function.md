# WireArray()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/wirearray/)

## Overview

The `WireArray()` function creates a new WireArray object, a powerful array-like structure used throughout ProcessWire for collections of objects.

## Usage

```php
// Create an empty WireArray
$wa = WireArray();

// Add items
$wa->add($item);
```

## Common Methods
- `add($item)`: Add an item to the array.
- `find($selector)`: Find items in the array.

## Notes
- Used internally by many ProcessWire APIs.

## See Also
- [WireArray class](https://processwire.com/api/ref/wirearray/)
