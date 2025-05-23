# Pages API

The Pages API provides methods for finding, creating, and managing pages in ProcessWire.

## Page Class

Represents a single page in ProcessWire.

### Key Properties
- `id` - Page ID (int)
- `template` - Template object
- `parent` - Parent page
- `children` - Child pages
- `created` - Creation timestamp
- `modified` - Last modified timestamp

### Key Methods
- `get($key)` - Get a field value
- `set($key, $value)` - Set a field value
- `save($field = '')` - Save the page
- `delete($recursive = false)` - Delete the page
- `render()` - Render the page

## PageArray Class

Collection of Page objects with additional methods for filtering and manipulation.

### Key Methods
- `find($selector)` - Find pages matching selector
- `filter($selector)` - Filter pages
- `sort($field)` - Sort pages
- `add($page)` - Add a page
- `remove($page)` - Remove a page

## Common Patterns

### Finding Pages
```php
// Find by template
$pages->find("template=blog-post");

// Find by parent
$pages->find("parent=/blog/");

// Find by date
$pages->find("created>today");

// Find with multiple conditions
$pages->find("template=product, price>100, sort=-created");
```

### Creating Pages
```php
$p = new Page();
$p->template = 'basic-page';
$p->parent = $pages->get('/products/');
$p->title = 'New Product';
$p->summary = 'Product description';
$p->save();
```

### Working with Page Fields
```php
// Get field value
$title = $page->title;

// Get image URL
$image = $page->image->size(400, 300)->url;

// Get formatted date
$date = $page->getFormatted('date');

// Get multiple fields
$data = $page->get([
    'title',
    'summary',
    'image'
]);
```

## Performance Tips

1. **Use Field Selectors**
   ```php
   // Good
   $pages->find("template=product, featured=1, limit=10");
   
   // Bad (slower)
   $all = $pages->find("template=product");
   $featured = [];
   foreach($all as $p) {
       if($p->featured) $featured[] = $p;
   }
   ```

2. **Limit Fields**
   ```php
   // Only load needed fields
   $pages->find("template=product, fields=title|price|image");
   ```

3. **Use Caching**
   ```php
   $cache = $this->wire('cache');
   $key = "recent_products";
   $products = $cache->get($key, 3600, function() {
       return $pages->find("template=product, sort=-created, limit=10");
   });
   ```
