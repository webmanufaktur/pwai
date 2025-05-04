# HookEvent

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/hook-event/)

## Overview

`HookEvent` represents an event triggered by ProcessWire's hooks system, allowing you to intercept and modify method calls.

## Usage

```php
$wire->addHook('Pages::save', function(HookEvent $event) {
    $page = $event->arguments(0);
    // ...
});
```

## Common Methods
- `arguments($n)`: Get the nth argument.
- `return`: Set or get the return value.

## See Also
- [Hooks in ProcessWire](https://processwire.com/docs/hooks/)
