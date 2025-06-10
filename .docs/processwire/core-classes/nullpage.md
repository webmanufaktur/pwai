# NullPage

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/null-page/)

## Overview

`NullPage` represents a non-existent or inaccessible page in ProcessWire, providing a safe object to prevent errors.

## Usage

```php
$page = $pages->get(123);
if($page->isnull()) {
    // Handle null page
}
```

## Common Methods

- `isnull()`: Checks if the page is a NullPage.

## See Also
- [Page Class](https://processwire.com/api/ref/page/)
