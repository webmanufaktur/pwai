# WireMail

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/wire-mail/)

## Overview

`WireMail` is the base class for sending email in ProcessWire. It supports multiple adapters and advanced email features.

## Usage

```php
$mail = wireMail();
$mail->to('user@example.com')->subject('Hello')->body('Message')->send();
```

## Common Methods
- `to($email)`: Set recipient.
- `subject($text)`: Set subject.
- `body($text)`: Set message body.
- `send()`: Send the email.

## See Also
- [$mail](./mail-variable.md)
- [WireMail Docs](https://processwire.com/api/ref/wire-mail/)
