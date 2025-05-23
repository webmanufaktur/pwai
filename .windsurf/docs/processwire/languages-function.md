# languages()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/languages/)

## Overview

The `languages()` function provides access to the Languages API, used for retrieving and managing language objects in a multi-language site.

## Usage

```php
// Get the Languages object
$languages = languages();

// List all languages
foreach(languages() as $language) {
    echo $language->title;
}
```

## Common Methods
- `get($selector)`: Get a language by selector.
- `add($data)`: Add a new language.
- `delete($language)`: Delete a language.

## Notes
- Equivalent to using the `$languages` API variable.

## See Also
- [$languages](./languages-variable.md)
