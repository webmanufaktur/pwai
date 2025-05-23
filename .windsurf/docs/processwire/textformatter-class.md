# Textformatter

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/textformatter/)

## Overview

`Textformatter` is the base class for modules that format text content in ProcessWire.

## Usage

Textformatters are typically assigned to fields to automatically format their output.

```php
$field = $fields->get('your_text_field');
$field->textformatters = ['Markdown']; // Assign the Markdown textformatter
```

## Common Methods (for developers creating custom Textformatters)

- `format($value)`: Formats the input value and returns the formatted output.

## See Also
- [Module Class](https://processwire.com/api/ref/module/)
- [Field Class](https://processwire.com/api/ref/field/)
