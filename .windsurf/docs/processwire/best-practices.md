# ProcessWire Best Practices

This document outlines recommended practices for developing with ProcessWire.

## Code Organization

### Directory Structure
```
templates/
├── _init.php          # Bootstrap file
├── _func.php          # Custom functions
├── _header.php        # Header template
├── _footer.php        # Footer template
├── _main.php          # Base template
├── home.php           # Home template
├── basic-page.php     # Basic page template
└── blog/
    ├── _main.php    # Blog base template
    ├── post.php      # Blog post template
    └── category.php # Category template
```

### Template Files
- Use descriptive names (e.g., `product-listing.php`)
- Keep templates in the `templates/` directory
- Use underscore prefix (`_header.php`) for includes

## Security

### Input Validation
```php
// Always sanitize user input
$name = $sanitizer->text($input->post->name);
$email = $sanitizer->email($input->post->email);
$html = $sanitizer->purify($input->post->html);
```

### File Operations
```php
// Secure file path handling
$file = $sanitizer->filename($input->get->file);
$path = $config->paths->files . $file;

// Verify path is within allowed directory
if(strpos(realpath($path), $config->paths->files) !== 0) {
    throw new Wire404Exception('Invalid file path');
}
```

## Performance

### Page Finding
- Use specific selectors
- Limit fields with `fields=`
- Use pagination for large result sets

```php
// Good: Specific selector with fields
$products = $pages->find("template=product, price>100, fields=title|price|image");

// Bad: Loading all fields
$products = $pages->find("template=product");
```

### Caching
```php
// Cache expensive operations
$cache = $modules->get('MarkupCache');
$key = 'featured_products';

if(!$html = $cache->get($key, 3600)) {
    $products = $pages->find("template=product, featured=1, limit=6");
    $html = '';
    foreach($products as $p) {
        $html .= "<div>{$p->title}</div>";
    }
    $cache->save($html);
}

echo $html;
```

## Development Workflow

### Debug Mode
```php
// In site/config.php
$config->debug = true;  // Enable debug mode
$config->dbCache = false; // Disable DB cache during development
```

### Error Reporting
```php
// In site/init.php
if($config->debug) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}
```

## Module Development

### Module Structure
```
site/modules/MyModule/
├── MyModule.module.php
├── MyModule.config.php
├── MyModule.info.php
└── README.md
```

### Module Info
```php
// MyModule.info.php
return [
    'title' => 'My Module',
    'version' => '1.0.0',
    'summary' => 'Does something awesome',
    'autoload' => true,
    'singular' => true,
];
```

## Frontend Development

### Asset Management
```html
<!-- In your template -->
<link rel="stylesheet" href="<?= $config->urls->templates ?>css/styles.css">
<script src="<?= $config->urls->templates ?>js/scripts.js"></script>
```

### Responsive Images
```php
// In your template
if($page->image) {
    $thumb = $page->image->size(800, 600);
    echo "<img 
        src='{$thumb->url}'
        srcset='{$thumb->srcset}'
        sizes='(max-width: 600px) 100vw, 800px'
        alt='{$thumb->description}'>";
}
```

## Database

### Custom Queries
```php
// Use prepared statements
$sql = "SELECT id, name FROM pages WHERE template='product' AND price > ?";
$query = $database->prepare($sql);
$query->execute([100]);
$results = $query->fetchAll(\PDO::FETCH_OBJ);
```

### Indexing
- Add indexes to frequently searched fields
- Use `$pages->find("index=field_name")` to utilize indexes

## Testing

### Unit Testing
```php
// In site/tests/MyTest.php
class MyTest extends PHPUnit\Framework\TestCase {
    public function testSomething() {
        $this->assertTrue(true);
    }
}
```

### Browser Testing
```php
// Example using Codeception
$I = new AcceptanceTester($scenario);
$I->wantTo('Test homepage');
$I->amOnPage('/');
$I->see('Welcome');
```

## Deployment

### Configuration
- Use `site/config.php` for environment-specific settings
- Keep sensitive data in `site/config-dev.php`

### Database Migrations
- Use ProcessWire's built-in migration system
- Or use a module like RockMigrations

## Maintenance

### Logging
```php
// Log messages
$this->log('Something happened');

// Log with context
$this->log('User action', [
    'user' => $user->name,
    'action' => 'login'
]);
```

### Monitoring
- Set up error logging
- Monitor server resources
- Use ProcessWire's built-in profiler

## Accessibility

### Semantic HTML
- Use proper heading hierarchy
- Include alt text for images
- Ensure proper form labels

### Keyboard Navigation
- Ensure all interactive elements are keyboard accessible
- Use `tabindex="0"` for focusable elements

## Internationalization

### Translation Strings
```php
// In your templates
<h1><?= __('Welcome') ?></h1>
<p><?= __('Hello, {name}', ['name' => $user->name]) ?></p>

// In translation files
return [
    'Welcome' => 'Bienvenue',
    'Hello, {name}' => 'Bonjour, {name}'
];
```

## Version Control

### .gitignore
```
# ProcessWire .gitignore
/site/assets/cache/
/site/assets/logs/
/site/assets/sessions/
/site/config-dev.php
/vendor/
/node_modules/
*.log
.DS_Store
```

### Deployment
- Use environment variables for configuration
- Automate deployment with CI/CD
- Test on staging before production
