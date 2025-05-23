# PaginatedArray

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/paginated-array/)

## Overview

`PaginatedArray` is a WireArray subclass that supports pagination, useful for large result sets.

## Usage

```php
$items = $pages->find('template=product', ['limit' => 10, 'start' => $start]);
// $items is a PaginatedArray
```

## Common Properties

- `total`: The total number of items before pagination.
- `limit`: The number of items per page.
- `start`: The starting index for the current page.
- `nextStart`: The starting index for the next page.
- `prevStart`: The starting index for the previous page.

## Common Methods

- `getPaginationMarkup()`: Generates HTML markup for pagination links.

## See Also
- [WireArray Class](https://processwire.com/api/ref/wire-array/)
- [MarkupPagerNav Class](./markuppagernav-class.md)
