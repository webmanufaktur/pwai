# WireHttp

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/wire-http/)

## Overview

`WireHttp` is a utility class for making HTTP requests (GET, POST, etc.) from within ProcessWire.

## Usage

```php
$http = new WireHttp();
$response = $http->get('https://api.example.com/data');
```

## Common Methods
- `get($url)`: Perform a GET request.
- `post($url, $data)`: Perform a POST request.

## See Also
- [WireHttp Docs](https://processwire.com/api/ref/wire-http/)
