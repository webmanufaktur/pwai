# $session API variable / Session class

Maintains sessions in ProcessWire, authentication, persistent variables, notices and redirects.

In addition to those shown below, the Session class also inherits all the methods and properties of: Wire.

## Redirects Methods

- `$session->redirect($url, $status = 302)` - Redirect the user to the given URL.
- `$session->redirectUrl($url = '')` - Get or set the URL to redirect to after login.

## Get Methods

- `$session->get($key)` - Get a session variable.
- `$session->getFor($namespace, $key)` - Get a session variable for a specific namespace.
- `$session->getIP()` - Get the user's IP address.
- `$session->getId()` - Get the session ID.

## Set Methods

- `$session->set($key, $value)` - Set a session variable.
- `$session->setFor($namespace, $key, $value)` - Set a session variable for a specific namespace.

## Remove Methods

- `$session->remove($key)` - Remove a session variable.
- `$session->removeFor($namespace, $key)` - Remove a session variable for a specific namespace.
- `$session->removeAllFor($namespace)` - Remove all session variables for a specific namespace.

## Info Methods

- `$session->getIP()` - Get the user's IP address.
- `$session->getId()` - Get the session ID.
- `$session->getForUser($user, $key)` - Get a session variable for a specific user.
- `$session->getCookieName()` - Get the name of the session cookie.

## Notices Methods

- `$session->message($text, $flags = 0)` - Add a message notice.
- `$session->error($text, $flags = 0)` - Add an error notice.
- `$session->warning($text, $flags = 0)` - Add a warning notice.
- `$session->messages($clear = true)` - Get all message notices.
- `$session->errors($clear = true)` - Get all error notices.
- `$session->warnings($clear = true)` - Get all warning notices.
- `$session->clearNotices()` - Clear all notices.

## Authentication Methods

- `$session->login($name, $pass)` - Log in a user.
- `$session->loginSuccess(User $user)` - Called after a successful login.
- `$session->logout()` - Log out the current user.
- `$session->forceLogin(User $user)` - Force login a user without password.
- `$session->allowLogin($name, $pass)` - Check if login is allowed.
- `$session->isLoggedin()` - Check if a user is logged in.
- `$session->getCSRF()` - Get the CSRF token.

## Advanced Methods

- `$session->init()` - Initialize the session.
- `$session->start()` - Start the session.
- `$session->destroy()` - Destroy the session.
- `$session->setCookieName($cookieName)` - Set the name of the session cookie.
- `$session->setSecondaryID($id)` - Set a secondary ID for the session.
- `$session->setTrackChanges($trackChanges = true)` - Set whether to track changes.
- `$session->save()` - Save the session.
- `$session->maintenance()` - Perform session maintenance.

## For Hooks Methods

- `$session->hookLogin($login, $result)` - Hook for login.
- `$session->hookLogout(User $user)` - Hook for logout.

## Common Methods

- `$session->CSRF()` - Get the CSRF protection object.
- `$session->getIP()` - Get the user's IP address.
- `$session->getId()` - Get the session ID.
- `$session->isLoggedin()` - Check if a user is logged in.
- `$session->login($name, $pass)` - Log in a user.
- `$session->logout()` - Log out the current user.
- `$session->redirect($url, $status = 302)` - Redirect the user to the given URL.

## Usage Examples

```php
// Set a session variable
$session->set('cart', $cart);

// Get a session variable
$cart = $session->get('cart');

// Remove a session variable
$session->remove('cart');

// Add a message notice
$session->message('Your changes have been saved.');

// Add an error notice
$session->error('There was an error processing your request.');

// Redirect the user
$session->redirect('/thank-you/');

// Log in a user
$session->login('username', 'password');

// Log out the current user
$session->logout();
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/session/).
