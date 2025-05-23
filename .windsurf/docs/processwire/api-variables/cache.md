# $cache API Variable

The `$cache` API variable provides powerful caching capabilities in ProcessWire.

## Overview

- **Type**: `WireCache`
- **Purpose**: Data and template caching
- **Availability**: Always available in templates and modules

## Basic Usage

### Storing Data
```php
// Basic cache for 1 hour (3600 seconds)
$cache->save('my-cache-key', 'cached data', 3600);

// Cache with array data
$data = ['name' => 'ProcessWire', 'version' => '3.0'];
$cache->save('my-data', $data);
```

### Retrieving Data
```php
// Get cached data
$data = $cache->get('my-cache-key');

// With default value if not found
$data = $cache->get('my-cache-key', 'default value');

// Using a callable that generates the value if not cached
$data = $cache->get('my-data', 3600, function() {
    // This code runs only if cache is empty
    return expensiveDatabaseQuery();
});
```

## Cache Expiration

### Time-based Expiration
```php
// Cache for 1 hour
$cache->save('key', $data, 3600);

// Cache for 1 day
$cache->save('key', $data, 86400);

// Cache until a specific timestamp
$expires = strtotime('tomorrow 2am');
$cache->save('key', $data, $expires);
```

### Event-based Expiration
```php
// Clear cache when any page is saved
$cache->save('key', $data, WireCache::expireSave('Page'));

// Clear cache when a specific template is saved
$cache->save('key', $data, WireCache::expireSave('template=basic-page'));

// Clear cache when a specific page is saved
$cache->save('key', $data, WireCache::expireSave(1234)); // 1234 is page ID
```

## Cache Namespaces

### Creating Namespaces
```php
// Get a namespaced cache instance
$myCache = $cache->getNamespace('my-namespace');

// Use the namespaced cache
$myCache->save('key', $data);
$data = $myCache->get('key');

// Clear all items in namespace
$myCache->deleteAll();
```

## Advanced Usage

### Cache Tags
```php
// Save with tags
$cache->save('key', $data, [
    'tags' => ['products', 'featured'],
    'expires' => 3600
]);

// Delete by tag
$cache->deleteTag('products');
```

### Cache Maintenance
```php
// Delete a specific cache
$cache->delete('my-cache-key');

// Delete all caches
$cache->deleteAll();

// Clean up expired caches
$cache->maintenance();
```

## Best Practices

1. **Key Naming**
   - Use descriptive, unique keys
   - Prefix keys with module name for custom caches
   - Example: `my-module-featured-products`

2. **Cache Invalidation**
   - Set appropriate expiration times
   - Use event-based expiration when possible
   - Clear caches when data changes

3. **Performance**
   - Cache expensive operations
   - Consider memory usage for large caches
   - Use namespaces to group related caches

## Common Use Cases

### Database Query Caching
```php
function getFeaturedProducts() {
    $cache = wire('cache');
    return $cache->get('featured-products', 3600, function() {
        return wire('pages')->find("template=product, featured=1, limit=10");
    });
}
```

### Template Caching
```php
// In your template file
if($page->template->name === 'product') {
    $cacheKey = "product-{$page->id}";
    $html = $cache->get($cacheKey, 86400); // Cache for 1 day
    
    if(!$html) {
        ob_start();
        // Your template code here
        $html = ob_get_clean();
        $cache->save($cacheKey, $html);
    }
    
    echo $html;
    return $this->halt();
}
```

## Configuration

### Cache Settings
Configure in `/site/config.php`:

```php
// Disable all caching (development only)
$config->debug = true;

// Custom cache directory
$config->paths->cache = $config->paths->site . 'my-cache/';

// Cache settings for template rendering
$config->templateCompile = true; // Enable template compilation
$config->templateCacheTime = 3600; // Template cache time in seconds
```

### Cache Backends
ProcessWire supports different cache backends:

1. **File-based** (default)
2. **Database**
3. **APC/APCu**
4. **Redis**
5. **Memcached**

Configure the cache backend in `config.php`:

```php
// Example: Redis configuration
$config->wireCacheStorage = 'WireCacheRedis';
$config->wireCacheRedis = [
    'host' => 'localhost',
    'port' => 6379,
    'database' => 0
];
```
