# $classLoader

**ProcessWire API Variable**

- [Official Docs](https://processwire.com/api/ref/class-loader/)

## Overview

The `$classLoader` API variable provides access to ProcessWire's autoloader for PHP classes. It is used for loading classes dynamically and managing namespaces.

## Usage

```php
// Register a new namespace
$classLoader->addNamespace('MyNamespace', '/path/to/classes');

// Load a class
$classLoader->loadClass('MyNamespace\\MyClass');
```

## Common Methods
- `addNamespace($prefix, $path)`: Register a namespace.
- `loadClass($class)`: Load a class by name.
- `getRegisteredNamespaces()`: Get all registered namespaces.

## Notes
- Useful for custom module or library development.

## See Also
- [ProcessWire Autoloading Docs](https://processwire.com/api/ref/class-loader/)
