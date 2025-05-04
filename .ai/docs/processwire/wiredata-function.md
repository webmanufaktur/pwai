# WireData()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/wiredata/)

## Overview

The `WireData()` function creates a new WireData object, a base class for storing data in ProcessWire.

## Usage

```php
// Create a new WireData object
$data = WireData();

// Set and get properties
$data->foo = 'bar';
echo $data->foo;
```

## Notes
- Used as a base for custom data objects.

## See Also
- [WireData class](https://processwire.com/api/ref/wiredata/)
