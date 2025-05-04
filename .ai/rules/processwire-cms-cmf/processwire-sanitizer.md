---
trigger: glob
globs: site/templates/**/*.php, site/modules/**/*.php
---

# ProcessWire Sanitizer

The Sanitizer class provides methods for sanitizing and validating user input, preparing data for output, and more. It's accessed via the `$sanitizer` API variable or `sanitizer()` function.

## Basic Usage

```php
$cleanValue = $sanitizer->text($dirtyValue);
```

## Sanitizer with Input

Sanitizer methods are accessible from `$input->get`, `$input->post` and `$input->cookie`:

```php
// Get GET variable 'id' as integer
$id = $input->get->int('id');

// Get POST variable 'name' as 1-line plain text
$name = $input->post->text('name');

// Get POST variable 'comments' as multi-line plain text
$comments = $input->post->textarea('comments');
```

In ProcessWire 3.0.125+, you can use a shorter syntax:

```php
$comments = $input->post('comments','textarea');
```

## Custom Sanitizers

Add your own sanitizers via hooks:

```php
$sanitizer->addHook('zip', function(HookEvent $event) {
    $sanitizer = $event->object;
    $value = $event->arguments(0);
    $value = $sanitizer->digits($value, 5);
    if(strlen($value) return = $value;
});

// Usage
$dirtyValue = 'Decatur GA 30030';
$cleanValue = $sanitizer->zip($dirtyValue);
// Outputs: 30030
```

## Advanced Features (3.0.125+)

### Combined Sanitizers
Chain sanitizers with underscores:

```php
$cleanValue = $sanitizer->text_entities($dirtyValue);
```

### Length Limitation
Append a number to limit string length:

```php
$cleanValue = $sanitizer->text20($dirtyValue);
```

## Validation

Convert sanitizer calls to validation:

```php
// Returns null if invalid
$value = $sanitizer->validate($value, 'email');

// Returns boolean
$isValid = $sanitizer->valid($value, 'email');
```

## Common Methods

### HTML
- `htmlClass(string $value)`: Sanitize to ASCII-only HTML class
- `htmlClasses($value, bool $getArray = false)`: Sanitize space-separated HTML classes

### Pages
- `pageName(string $value, $beautify = false, $maxLength = 128, array $options = [])`: Sanitize as a page name
- `pageNameTranslate(string $value, int $maxLength = 128)`: Page names with transliteration
- `pageNameUTF8(string $value, int $maxLength = 128)`: Allow UTF-8 characters in page name
- `pagePathName(string $value, $beautify = false, int $maxLength = 2048)`: Sanitize a page path name
- `pagePathNameUTF8(string $value)`: Sanitize a UTF-8 page path name
- `path(string $value, $options = [])`: Validate path, return path if valid or false

### Files
- `filename(string $value, $beautify = false, int $maxLength = 128)`: Filter for filenames
- `validateFile(string $filename, array $options = [])`: Validate and sanitize a file

### Validation
- `email(string $value, array $options = [])`: Sanitize and validate email
- `httpUrl(string $value, array $options = [])`: URL with http/https scheme required
- `url(string $value, $options = [])`: Sanitize and validate URL
- `valid($value, string $method = 'text', bool $strict = false)`: Check if value is valid
- `validate($value, string $method = 'text', $fallback = null)`: Validate value remains unchanged

### Constants
- `Sanitizer::translate`: Constant (value 2) for transliteration in name sanitizer methods

Citations:
[1] https://processwire.com/api/ref/sanitizer/
[2] https://processwire.com/api/ref/sanitizer/

---
Answer from Perplexity: pplx.ai/share
