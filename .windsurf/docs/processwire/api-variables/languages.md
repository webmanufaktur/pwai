# $languages

**ProcessWire API Variable**

- [Official Docs](https://processwire.com/api/ref/languages/)

## Overview

The `$languages` API variable provides access to all defined languages in a multi-language ProcessWire installation. It is used for managing and retrieving language objects.

## Usage

```php
// Get all languages
foreach($languages as $language) {
    echo $language->title;
}

// Find a language by name
$german = $languages->get('name=de');
```

## Common Methods
- `get($selector)`: Get a Language object by selector.
- `add($data)`: Add a new language.
- `delete($language)`: Delete a language.

## Notes
- Available only if the LanguageSupport module is installed.
- `$languages` is an instance of `Languages` class.

## See Also
- [$user](./user-variable.md)
- [Language Support Docs](https://processwire.com/api/multi-language/)
