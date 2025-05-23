---
trigger: glob
globs: site/templates/hooks/**/*.php, site/modules/**/*.php
---

# ProcessWire URL Hooks/Path Hooks

URL/path hooks allow you to handle specific URLs in ProcessWire without creating pages. This feature lets you create custom URL handlers with full access to the ProcessWire API.

## Basic Usage

```php
// Add in /site/init.php or /site/ready.php
$wire->addHook('/hello/world', function($event) {
  return 'Hello World';
});
```

When accessing `/hello/world/`, this will output "Hello World" and nothing else.

## Return Values

The value returned from a URL hook determines what happens next:

- **String**: Output of string is sent
- **Page**: Returned Page is rendered and made the current $page API variable
- **Array**: Converted to JSON and output with "application/json" content-type header
- **True**: Boolean true indicates you are handling the URL and are outputting directly
- **False** or **None**: 404 response

## Handling Output Yourself

If you want to output content yourself:

```php
$wire->addHook('/hello/world', function($event) {
  echo 'Hello World';
  return true;
});
```

## Rendering Specific Pages

To render a specific page for a URL:

```php
$wire->addHook('/hello/world', function($event) {
  return $event->pages->get('/about/contact/');
});
```

## Dynamic URL Patterns

### Using OR Conditions

```php
$wire->addHook('/hello/(earth|mars|jupiter)', function($event) {
  return "Hello " . $event->arguments(1);
});
```

### Using Named Arguments

Simple named arguments:

```php
$wire->addHook('/hello/{planet}', function($event) {
  return "Hello " . $event->arguments('planet');
  // Or: return "Hello " . $event->planet;
});
```

Pattern matching named arguments:

```php
$wire->addHook('/hello/(planet:earth|mars|jupiter)', function($event) {
  return "Hello " . $event->planet;
});
```

## Practical Examples

### JSON Output for Any Page

```php
$wire->addHook('(/.*)/json', function($event) {
  $page = $event->pages->findOne($event->arguments(1));
  if($page->viewable()) return [
    'id' => $page->id,
    'url' => $page->url,
    'title' => $page->title,
    'summary' => $page->summary
  ];
});
```

### Short URLs for Blog Posts

```php
$wire->addHook('/([0-9]+)', function($event) {
  $id = $event->arguments(1);
  $post = $event->pages->findOne("template=blog-post, id=$id");
  if($post->viewable()) return $post;
});
```

## Additional Details

### Trailing Slashes

ProcessWire enforces the trailing-slash state of the request to match your hook definition:

- With trailing slash: `/foo/bar/` - redirects `/foo/bar` to `/foo/bar/`
- Without trailing slash: `/foo/bar` - redirects `/foo/bar/` to `/foo/bar`
- Allow both: `/foo/bar/?`

### Pagination

To support pagination, append `{pageNum}` to your path:

```php
$wire->addHook('/foo/bar/{pageNum}', function($event) {
  return "You are on page $event->pageNum";
});
```

Notes on pagination:

- Default value is 1 when no pagination number is present
- URLs with `/page1` redirect to the URL without the pagination number
- Must be the last segment in the URL without a trailing slash
- Access via `$event->pageNum`, `$event->arguments('pageNum')` or `wire()->input->pageNum`

### Conditional Hooks

You can add conditions to your hooks:

```php
if($input->is('POST')) {
  $wire->addHook('/foo/bar/', function($e) { /* ... */ });
}

if($config->ajax) {
  $wire->addHook('/foo/bar/', function($e) { /* ... */ });
}
```
