# wireRenderFile()

**ProcessWire Files Function**

- [Official Docs](https://processwire.com/api/ref/wirerenderfile/)

## Overview

`wireRenderFile()` renders a PHP file with specified variables in scope, returning the output.

## Usage

```php
$output = wireRenderFile('/path/to/template.php', [
    'title' => 'Page Title',
    'content' => 'Page content'
]);
```

## See Also
- [wireIncludeFile()](./wireincludefile-function.md)
