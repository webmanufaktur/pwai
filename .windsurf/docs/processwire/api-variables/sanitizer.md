# $sanitizer API variable / Sanitizer class

Provides methods for sanitizing and validating user input, preparing data for output, and more.

Sanitizer is useful for sanitizing input or any other kind of data that you need to match a particular type or format. The Sanitizer methods are accessed from the `$sanitizer` API variable and/or `sanitizer()` API variable/function.

```php
$cleanValue = $sanitizer->text($dirtyValue);
```

You can replace the `text()` call above with any other sanitizer method. Many sanitizer methods also accept additional arguments—see each individual method for details.

## Sanitizer and Input

Sanitizer methods are most commonly used with user input. As a result, the methods in this class are also accessible from the `$input->get`, `$input->post` and `$input->cookie` API variables, in the same manner that they are here. This is a useful shortcut for instances where you don't need to provide additional arguments to the sanitizer method.

```php
// get GET variable 'id' as integer
$id = $input->get->int('id');

// get POST variable 'name' as 1-line plain text
$name = $input->post->text('name');

// get POST variable 'comments' as multi-line plain text
$comments = $input->post->textarea('comments');
```

In ProcessWire 3.0.125 and newer you can also perform the same task as the above with one less `->` level like the example below:

```php
$comments = $input->post('comments','textarea');
```

This is more convenient in some IDEs because it'll never be flagged as an unrecognized function call. Though outside of that it makes little difference how you call it, as they both do the same thing.

## Adding Your Own Sanitizers

You can easily add your own new sanitizers via ProcessWire hooks. Hooks are commonly added in a `/site/ready.php` file, or from a Module, though you may add them wherever you want. The following example adds a sanitizer method called `zip()` which enforces a 5 digit zip code:

```php
$sanitizer->addHook('zip', function(HookEvent $event) {
  $sanitizer = $event->object;
  $value = $event->arguments(0); // get first argument given to method
  $value = $sanitizer->digits($value, 5); // allow only digits, max-length 5
  if(strlen($value) < 5) $value = ''; // if fewer than 5 digits, it is not a zip
  $event->return = $value;
});

// now you can use your zip sanitizer
$dirtyValue = 'Decatur GA 30030';
$cleanValue = $sanitizer->zip($dirtyValue);
echo $cleanValue; // outputs: 30030
```

## Common Sanitizer Methods

- `$sanitizer->alpha($value, $options = [])` - Sanitize to only alphabetical characters (a-z A-Z).
- `$sanitizer->alphanumeric($value, $options = [])` - Sanitize to only alphabetical and numeric characters (a-z A-Z 0-9).
- `$sanitizer->array($value, $sanitizer = null)` - Sanitize an array of values.
- `$sanitizer->bool($value)` - Sanitize to boolean.
- `$sanitizer->date($value, $format = null)` - Sanitize to date string.
- `$sanitizer->digits($value, $maxLength = null)` - Sanitize to only digits (0-9).
- `$sanitizer->email($value)` - Sanitize to email address.
- `$sanitizer->entities($value)` - Convert HTML entities.
- `$sanitizer->filename($value)` - Sanitize to valid filename.
- `$sanitizer->float($value, $precision = null)` - Sanitize to float.
- `$sanitizer->int($value)` - Sanitize to integer.
- `$sanitizer->name($value, $beautify = false)` - Sanitize to ProcessWire name format.
- `$sanitizer->pageName($value, $options = [])` - Sanitize to ProcessWire page name format.
- `$sanitizer->path($value)` - Sanitize to file system path.
- `$sanitizer->text($value, $maxLength = null)` - Sanitize to single line text.
- `$sanitizer->textarea($value, $maxLength = null)` - Sanitize to multi-line text.
- `$sanitizer->url($value)` - Sanitize to URL.

## Additional Categories

The Sanitizer class also includes methods for:

- Numbers
- Strings
- Arrays
- Pages
- Files
- Validation
- Other

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/sanitizer/).
