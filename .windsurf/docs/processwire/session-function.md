# session()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/session/)

## Overview

The `session()` function provides access to the Session API, allowing you to manage user sessions, store and retrieve session variables, and handle login/logout.

## Usage

```php
// Get the Session object
$session = session();

// Set a session variable
session()->foo = 'bar';

// Get a session variable
echo session()->foo;
```

## Common Methods
- `logout()`: Log out the current user.
- `redirect($url)`: Redirect and end the session.

## Notes
- Equivalent to using the `$session` API variable.

## See Also
- [$session](./session-variable.md)
