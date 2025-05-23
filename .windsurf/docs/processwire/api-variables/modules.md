# $modules API variable / Modules class

Loads and manages all modules in ProcessWire.

The $modules API variable is most commonly used for getting individual modules to use their API.

```php
// Getting a module by name
$m = $modules->get('MarkupPagerNav');

// Getting a module by name (alternate)
$m = $modules->MarkupPagerNav;
```

In addition to those shown below, the Modules class also inherits all the methods and properties of: WireArray and Wire.

## Common Methods

- `$modules->findByInfo($selector, $load = false)` - Find modules matching the given selector in their module info. Returns an array.
- `$modules->findByPrefix(string $prefix, $load = false)` - Find modules matching the given prefix. Returns an array.
- `$modules->get($key)` - Get a module instance by name. Returns a Module, _Module, or null.
- `$modules->getDebugData()` - Get debug data for modules.
- `$modules->getModule($key, array $options = [])` - Get a module instance by name with options. Returns a Module, _Module, null, or string.
- `$modules->getModuleFile($class, $options = [])` - Get the file for a module. Returns a boolean or string.
- `$modules->getModuleID($class)` - Get the ID of a module. Returns an integer.
- `$modules->getModuleInfo($class, array $options = [])` - Get the info for a module. Returns an array.
- `$modules->getModuleInfoProperty($class, string $property, array $options = [])` - Get a specific property from a module's info. Returns mixed or null.
- `$modules->getModuleInfoVerbose($class, array $options = [])` - Get verbose info for a module. Returns an array.
- `$modules->getModuleLanguageFiles($module)` - Get language files for a module. Returns an array.
- `$modules->isInstalled(string $class)` - Check if a module is installed. Returns a boolean.
- `$modules->memcache(string $name, mixed $setValue = null)` - Get or set a value in the modules memory cache. Returns boolean, array, mixed, or null.

## Manipulation Methods

- `$modules->delete(string $class)` - Delete a module. Returns a boolean.
- `$modules->install(string $class, $options = [])` - Install a module. Returns null or Module.
- `$modules->refresh(bool $showMessages = false)` - Refresh the modules cache.
- `$modules->saveConfig($class, $data, $value = null)` - Save configuration for a module. Returns a boolean.
- `$modules->uninstall(string $class)` - Uninstall a module. Returns a boolean.

## Configuration Methods

The Modules class also includes methods for configuring modules.

## Properties

- `ModulesConfigs` - Access to module configurations.
- `ModulesFiles` - Access to module files.
- `ModulesFlags` - Access to module flags.
- `ModulesInfo` - Access to module info.
- `ModulesInstaller` - Access to module installer.
- `ModulesLoader` - Access to module loader.

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/modules/).
