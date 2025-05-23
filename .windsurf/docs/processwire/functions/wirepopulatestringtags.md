# wirePopulateStringTags()

**ProcessWire Strings Function**

- [Official Docs](https://processwire.com/api/ref/wirepopulatestringtags/)

## Overview

`wirePopulateStringTags()` populates a string with {tags} from an associative array of values.

## Usage

```php
$str = 'Hello {name}!';
$tags = ['name' => 'World'];
echo wirePopulateStringTags($str, $tags); // "Hello World!"
```

## See Also
- [PHP str_replace()](https://www.php.net/manual/en/function.str-replace.php)
