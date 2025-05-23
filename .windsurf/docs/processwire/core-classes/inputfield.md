# Inputfield

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/inputfield/)

## Overview

`Inputfield` is the base class for all input fields in ProcessWire, defining how user input is presented and handled in the admin.

## Usage

Typically, you interact with Inputfields when building custom modules or process pages.

```php
$inputfield = $modules->get('InputfieldText');
$inputfield->attr('name', 'my_text_field');
$inputfield->label = 'My Text Field';
echo $inputfield->render();
```

## Common Properties

- `name`: The name of the input field.
- `label`: The label displayed for the input field.
- `value`: The current value of the input field.
- `description`: A description for the input field.
- `notes`: Additional notes for the input field.

## Common Methods

- `attr($name, $value = null)`: Gets or sets an attribute on the input field's HTML element.
- `wrapAttr($name, $value = null)`: Gets or sets an attribute on the input field's wrapper element.
- `addClass($class)`: Adds a CSS class to the input field's wrapper.
- `removeClass($class)`: Removes a CSS class from the input field's wrapper.
- `render()`: Renders the HTML markup for the input field.

## See Also
- [Fieldtype Class](./fieldtype-class.md)
- [InputfieldWrapper Class](./inputfieldwrapper-class.md)
