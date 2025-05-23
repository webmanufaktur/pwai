# MarkupPagerNav

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/markup-pager-nav/)

## Overview

`MarkupPagerNav` is used for rendering pagination links for paginated lists in ProcessWire.

## Usage

```php
$pager = $modules->get('MarkupPagerNav');
echo $pager->render($items);
```

## Common Methods
- `render($items)`: Render pagination for a set of items.

## See Also
- [Pagination Guide](https://processwire.com/docs/front-end/output/pagination/)
