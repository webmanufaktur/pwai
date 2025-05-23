# ProcessWire Functions

This document covers essential functions available in ProcessWire.

## Page Functions

### `page($selector, $options = [])`
Get a single page matching the selector.

**Parameters:**
- `$selector` (string|int) - Page selector or ID
- `$options` (array) - Additional options

**Returns:** `Page` object or `NullPage`

**Example:**
```php
// Get page by ID
$p = page(1015);

// Get page by path
$about = page('/about/');

// With options
$page = page('template=blog-post', ['getNumChildren' => true]);
```

### `pages($selector, $options = [])`
Find multiple pages matching the selector.

**Parameters:**
- `$selector` (string) - Page selector
- `$options` (array) - Additional options

**Returns:** `PageArray`

**Example:**
```php
// Find all blog posts
$posts = pages('template=blog-post, sort=-date');

// With pagination
$posts = pages('template=blog-post, limit=10, start=0');
```

## String Functions

### `sanitizer($name, $value)`
Sanitize a value using the specified sanitizer.

**Parameters:**
- `$name` (string) - Sanitizer name
- `$value` (mixed) - Value to sanitize

**Returns:** Sanitized value

**Example:**
```php
$clean = sanitizer('text', $input->post->text);
$email = sanitizer('email', $input->post->email);
$html = sanitizer('purify', $input->post->html);
```

### `__($text, $textdomain = 'site')`
Translate text.

**Parameters:**
- `$text` (string) - Text to translate
- `$textdomain` (string) - Text domain

**Returns:** Translated string

**Example:**
```php
echo __('Welcome back!');
```

## Debugging Functions

### `bd($var, $name = null)`
Debug output to the admin toolbar.

**Parameters:**
- `$var` (mixed) - Variable to debug
- `$name` (string) - Optional label

**Example:**
```php
bd($page, 'Current Page');
```

### `d($var)`
Dump variable and die.

**Parameters:**
- `$var` (mixed) - Variable to dump

**Example:**
```php
d($page->getArray());
```

## File Functions

### `wireEncodeJSON($value)`
Encode a value to JSON.

**Parameters:**
- `$value` (mixed) - Value to encode

**Returns:** JSON string

### `wireDecodeJSON($json)`
Decode a JSON string.

**Parameters:**
- `$json` (string) - JSON string

**Returns:** Decoded value

## Utility Functions

### `wire('log')->save($name, $message)`
Write to a log file.

**Parameters:**
- `$name` (string) - Log name
- `$message` (string) - Message to log

**Example:**
```php
wire('log')->save('my-log', 'Something happened');
```

### `setting($key, $value = null)`
Get or set a runtime setting.

**Parameters:**
- `$key` (string) - Setting name
- `$value` (mixed) - Optional value to set

**Returns:** Setting value

**Example:**
```php
// Get setting
$debug = setting('debug');

// Set setting
setting('mySetting', 'value');
```

## Common Patterns

### Working with Arrays
```php
// Convert PageArray to array
$array = $pages->find('template=basic-page')->getArray();

// Filter array
$filtered = array_filter($array, function($item) {
    return $item->status === 'active';
});

// Map array
$titles = array_map(function($item) {
    return $item->title;
}, $array);
```

### Working with Dates
```php
// Current timestamp
$now = time();

// Format date
echo date('Y-m-d H:i:s', $page->created);

// Relative time
$date = wire('datetime')->relativeTimeStr($page->created);
```

### URL Handling
```php
// Get current URL
$url = $page->url;

// Build URL with query string
$url = $pages->get(1001)->url . '?sort=date';

// Sanitize URL
$cleanUrl = $sanitizer->url($input->post->url);
```
