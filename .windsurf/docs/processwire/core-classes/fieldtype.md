# Fieldtype

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/fieldtype/)

## Overview

`Fieldtype` is the base class for all field types in ProcessWire, defining how data is stored and managed for a field.

## Usage

Typically, you interact with Fieldtypes through the `$fields` API variable.

```php
$field = $fields->get('your_field_name');
$fieldtype = $field->type; // Get the Fieldtype object
```

## Common Methods (for developers creating custom Fieldtypes)

- `getInputfield(Page $page, Field $field)`: Returns an Inputfield object for the field.
- `getDatabaseSchema(Field $field)`: Returns the database schema for the field.
- `sanitizeValue(Page $page, Field $field, $value)`: Sanitizes the value for the field.
- `formatValue(Page $page, Field $field, $value)`: Formats the value for output.

## See Also
- [$fields Variable](https://processwire.com/api/ref/fields/)
- [Field Class](https://processwire.com/api/ref/field/)
- [Inputfield Class](https://processwire.com/api/ref/inputfield/)
