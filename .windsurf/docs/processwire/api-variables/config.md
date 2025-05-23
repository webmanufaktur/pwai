# $config API variable / Config class

Holds ProcessWire configuration settings as defined in /wire/config.php and /site/config.php.

For more detailed descriptions of these $config properties, including default values, see the [/wire/config.php](https://github.com/processwire/processwire/blob/master/wire/config.php) file.

In addition to those shown below, the Config class also inherits all the methods and properties of: WireData and Wire.

## Common Methods

- `$config->get($key)` - Get a configuration value.
- `$config->set($key, $value)` - Set a configuration value.
- `$config->save()` - Save configuration changes.

## Date Time Properties

- `$config->dateFormat` - Default date format used by date() function.
- `$config->timeFormat` - Default time format used by date() function.

## URLs Methods

- `$config->requestPath($match = '')` - Get the current request path. Returns a string.
- `$config->requestUrl($match = '', string $get = '')` - Get the current request URL. Returns a string.
- `$config->setLocation(string $for, string $dir, $url = '')` - Set a location (path and URL). Returns self.
- `$config->setUrl(string $for, string $url)` - Set a URL. Returns self.
- `$config->url($for)` - Get a URL. Returns a string or null.
- `$config->urls($for = '')` - Get all URLs or a specific URL. Returns null or string.
- `$config->versionUrl(string $url, $useVersion = null)` - Get a versioned URL. Returns a string.
- `$config->versionUrls($urls, $useVersion = null)` - Get versioned URLs. Returns an array.

## Paths Methods

- `$config->path(string $for)` - Get a path. Returns null or string.
- `$config->paths(string $for = '')` - Get all paths or a specific path. Returns null or string.
- `$config->setLocation(string $for, string $dir, $url = '')` - Set a location (path and URL). Returns self.
- `$config->setPath(string $for, string $path)` - Set a path. Returns self.

## JavaScript Methods

- `$config->js($key = null, mixed $value = null)` - Get or set JavaScript configuration. Returns array, mixed, null, or this.
- `$config->jsConfig(string $key = null, $value = null)` - Get or set JavaScript configuration. Returns mixed, null, array, or self.

## Tools Methods

- `$config->installedAfter($date)` - Check if ProcessWire was installed after the given date. Returns a boolean.
- `$config->installedBefore($date)` - Check if ProcessWire was installed before the given date. Returns a boolean.
- `$config->phpVersion($minVersion)` - Check if PHP version is at least the given version. Returns a boolean.
- `$config->requestMethod($match = '')` - Get the current request method. Returns a string.
- `$config->requestPath($match = '')` - Get the current request path. Returns a string.
- `$config->requestUrl($match = '', string $get = '')` - Get the current request URL. Returns a string.
- `$config->version(string $minVersion = '')` - Get the ProcessWire version or check if it's at least the given version. Returns a boolean or string.
- `$config->versionUrl(string $url, $useVersion = null)` - Get a versioned URL. Returns a string.
- `$config->versionUrls($urls, $useVersion = null)` - Get versioned URLs. Returns an array.

## Additional Categories

The Config class also includes properties and methods for:

- Runtime
- HTTP and input
- System
- Template files
- Files
- Session
- Images
- Database
- Modules
- Admin
- System IDs

## Usage Examples

```php
// Get a configuration value
$debug = $config->debug;

// Set a configuration value
$config->debug = true;

// Get a URL
$adminUrl = $config->urls->admin;

// Get a path
$sitePath = $config->paths->site;

// Check if ProcessWire version is at least 3.0.0
if($config->version('3.0.0')) {
    // Use features available in ProcessWire 3.0.0+
}

// Set JavaScript configuration
$config->js('myApp', [
    'apiUrl' => $config->urls->api,
    'debug' => $config->debug
]);
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/config/).
