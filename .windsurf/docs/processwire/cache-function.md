# cache()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/cache/)

## Overview

The `cache()` function provides access to ProcessWire's caching system, allowing you to store and retrieve data efficiently.

## Usage

```php
// Get the Cache object
$cache = cache();

// Save data to cache
cache()->save('mykey', $data, $expireSeconds = 3600);

// Retrieve data from cache
$data = cache()->get('mykey');
```

## Common Methods
- `save($name, $value, $expireSeconds)`: Save a value to the cache.
- `get($name)`: Retrieve a value from the cache.
- `delete($name)`: Remove a cached value.

## Notes
- Useful for performance optimization.

## See Also
- [$cache](./cache-variable.md)
