# modules()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/modules/)

## Overview

The `modules()` function provides access to the Modules API, used for loading and managing ProcessWire modules.

## Usage

```php
// Get the Modules object
$modules = modules();

// Get a module by name
$module = modules()->get('ProcessPageEdit');
```

## Common Methods
- `get($name)`: Get a module by name.
- `install($name)`: Install a module.
- `uninstall($name)`: Uninstall a module.

## Notes
- Equivalent to using the `$modules` API variable.

## See Also
- [$modules](./modules.md)
