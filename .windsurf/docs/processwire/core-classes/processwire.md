# ProcessWire

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/process-wire/)

## Overview

`ProcessWire` is the main application class, acting as the central hub for all core objects, API variables, and services.

## Usage

```php
$wire = $this->wire();
$config = $wire->config;
```

## Common Properties
- `config`: Site configuration.
- `pages`: Page API.
- `templates`: Template API.
- `modules`: Modules API.

## See Also
- [API Variables](https://processwire.com/api/ref/)
- [ProcessWire Docs](https://processwire.com/api/ref/process-wire/)
