# wire()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/wire/)

## Overview

The `wire()` function is the core dependency injection and service locator function in ProcessWire. It is used to access API variables, core objects, and services.

## Usage

```php
// Get an API variable
$page = wire('page');

// Get a service or object
$sanitizer = wire('sanitizer');
```

## Notes
- Central to ProcessWire's architecture.
- Can be used to get/set variables and services.

## See Also
- [ProcessWire API Variables](https://processwire.com/api/ref/)
