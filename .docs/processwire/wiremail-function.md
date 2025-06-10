# wireMail()

**ProcessWire Common Function**

- [Official Docs](https://processwire.com/api/ref/wiremail/)

## Overview

`wireMail()` creates a new WireMail instance for sending emails in ProcessWire.

## Usage

```php
$mail = wireMail();
$mail->to('user@example.com')
     ->subject('Hello')
     ->body('Message')
     ->send();
```

## See Also
- [$mail](./mail-variable.md)
- [WireMail](./wiremail-class.md)
