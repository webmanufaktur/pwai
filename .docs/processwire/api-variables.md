# API Variables

ProcessWire provides several API variables that are always available in your templates and modules.

## Primary Variables

### `$page`
- **Type**: `Page`
- **Description**: The current page being viewed
- **Example**: `$page->title`

### `$pages`
- **Type**: `Pages`
- **Description**: API for finding and managing pages
- **Example**: `$pages->find("template=blog")`

### `$input`
- **Type**: `WireInput`
- **Description**: Access to GET, POST, COOKIE, and other input variables
- **Example**: `$input->get->pageNum`

### `$user`
- **Type**: `User`
- **Description**: Current logged-in user
- **Example**: `$user->isLoggedin()`

### `$users`
- **Type**: `Users`
- **Description**: API for finding and managing users
- **Example**: `$users->get('admin')`

## Utility Variables

### `$config`
- **Type**: `Config`
- **Description**: System configuration
- **Example**: `$config->urls->templates`

### `$modules`
- **Type**: `Modules`
- **Description**: Module manager
- **Example**: `$modules->get('ProcessPageEdit')`

### `$session`
- **Type**: `Session`
- **Description**: Session management
- **Example**: `$session->set('message', 'Hello!')`

### `$sanitizer`
- **Type**: `Sanitizer`
- **Description**: Data sanitization
- **Example**: `$sanitizer->text($input->post->text)`

## Common Methods

### Getting Values
```php
// Get page field
$title = $page->get('title');

// Get with fallback
$headline = $page->get('headline|title');

// Get multiple fields
$values = $page->get(['title', 'summary', 'date']);
```

### Setting Values
```php
// Set single value
$page->title = 'New Title';

// Set multiple values
$page->setAndSave([
    'title' => 'New Title',
    'status' => 'unpublished'
]);
```
