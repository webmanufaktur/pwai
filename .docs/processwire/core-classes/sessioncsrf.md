# SessionCSRF

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/session-c-s-r-f/)

## Overview

`SessionCSRF` provides CSRF (Cross-Site Request Forgery) protection services in ProcessWire, such as generating and validating CSRF tokens.

## Usage

```php
$token = $session->CSRF->getTokenName();
$inputfield->attr('value', $session->CSRF->getTokenValue());
```

## Common Methods
- `getTokenName()`: Get the CSRF token name.
- `getTokenValue()`: Get the CSRF token value.
- `validate()`: Validate the CSRF token.

## See Also
- [$session](./session-variable.md)
- [CSRF Docs](https://processwire.com/api/ref/session-c-s-r-f/)
