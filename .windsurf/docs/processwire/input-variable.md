# $input API variable / WireInput class

Provides a means to get user input from URLs, GET, POST, and COOKIE variables and more.

In addition to those shown below, the WireInput class also inherits all the methods and properties of: Wire.

## Common Methods

- `$input->cookie(string $key = '', $valid = null, $fallback = null)` - Get a value from the COOKIE variables. Returns null, mixed, or WireInputData.
- `$input->get(string $key = '', $valid = null, $fallback = null)` - Get a value from the GET variables. Returns null, mixed, or WireInputData.
- `$input->is(string $method)` - Check if the request method matches the given method. Returns a boolean.
- `$input->post(string $key = '', $valid = null, $fallback = null)` - Get a value from the POST variables. Returns null, mixed, or WireInputData.
- `$input->requestMethod(string $method = '')` - Get or check the request method. Returns a string or boolean.
- `$input->whitelist(string $key = '', mixed $value = null)` - Get or set a value in the whitelist. Returns null, mixed, or WireInputData.

## URL Segments Methods

- `$input->pageNum()` - Get the current page number. Returns an integer.
- `$input->pageNumStr(int $pageNum = 0)` - Get the page number string. Returns a string.
- `$input->setPageNum(int $num)` - Set the current page number.
- `$input->setUrlSegment(int $num, $value)` - Set a URL segment.
- `$input->urlSegment($get = 1)` - Get a URL segment. Returns a string, integer, or boolean.
- `$input->urlSegmentStr($verbose = false, array $options = [])` - Get the URL segment string. Returns a string.
- `$input->urlSegments()` - Get all URL segments. Returns an array.

## URLs Methods

- `$input->canonicalUrl(array $options = [])` - Get the canonical URL. Returns a string.
- `$input->httpHostUrl($scheme = null, string $httpHost = '')` - Get the HTTP host URL. Returns a string.
- `$input->httpUrl($options = [])` - Get the HTTP URL. Returns a string.
- `$input->httpsUrl($options = [])` - Get the HTTPS URL. Returns a string.
- `$input->queryString(array $overrides = [])` - Get the query string. Returns a string.
- `$input->queryStringClean(array $options = [])` - Get a clean query string. Returns a string.
- `$input->scheme()` - Get the current scheme (http or https). Returns a string.
- `$input->url($options = [])` - Get the current URL. Returns a string.

## Usage Examples

```php
// Get a GET variable
$id = $input->get('id');

// Get a GET variable as an integer
$id = $input->get->int('id');

// Get a POST variable
$name = $input->post('name');

// Get a POST variable as text
$name = $input->post->text('name');

// Get a COOKIE variable
$cookie = $input->cookie('cookie_name');

// Check if request method is POST
if($input->is('post')) {
    // Process POST request
}

// Get URL segments
$segment1 = $input->urlSegment(1);
$segment2 = $input->urlSegment(2);

// Get all URL segments
$segments = $input->urlSegments();

// Get the current URL
$url = $input->url();
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/input/).
