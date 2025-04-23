# ProcessWire Hooks Guide

## Types of Hooks

- **Before hooks**: Run before the hooked method, can analyze/modify arguments
- **After hooks**: Run after the hooked method, can analyze/modify return values
- **Replace hooks**: Completely replace the hooked method's functionality
- **Method hooks**: Add new methods to existing classes
- **Property hooks**: Add new properties to existing classes
- **URL/path hooks**: Hook into ProcessWire's URL routing

## Hookable Methods

Any method that begins with three underscores (`___method()`) is hookable. Methods added via hooks are also hookable.

## Adding Hooks

### Before vs After Hooks

```php
// Before hook (inside a class)
$this->addHookBefore('Class::method', function($event) {
    // Implementation
});

// Before hook (outside a class)
wire()->addHookBefore('Class::method', function($event) {
    // Implementation
});

// After hook (inside a class)
$this->addHookAfter('Class::method', function($event) {
    // Implementation
});

// After hook (outside a class)
wire()->addHookAfter('Class::method', function($event) {
    // Implementation
});
```

### Hook Both Before and After

```php
$wire->addHook('Class::method', function(HookEvent $e) {
    if($e->when == 'before') {
        // Before state
    } else if($e->when == 'after') {
        // After state
    }
}, ['before' => true, 'after' => true]);
```

### Hooking All Instances vs Single Instance

```php
// Hook all instances
$this->addHookAfter('Class::method', function($event) {
    // Implementation
});

// Hook single instance
$page->addHookAfter('render', function($event) {
    // Implementation
});
```

## Where to Define Hooks

- **Module init()**: Before ProcessWire handles a request
- **Module ready()**: After ProcessWire determines the page to view
- **/site/ready.php**: When API is ready but before rendering
- **/site/init.php**: During ProcessWire initialization
- **Template files**: At the top of template files

## Working with Arguments and Return Values

### Accessing Arguments

```php
public function myHookFunction($event) {
    // By index (0-based)
    $page = $event->arguments(0);
    
    // By name
    $page = $event->arguments('page');
}
```

### Modifying Arguments (Before hooks only)

```php
// By index
$event->arguments(0, $myValue);

// By name
$event->arguments('argument_name', $myValue);
```

### Accessing/Modifying Return Values (After hooks only)

```php
public function hookAfterPageRender($event) {
    $value = $event->return;
    $value = str_replace("", "Hello World!", $value);
    $event->return = $value;
}
```

### Accessing the Object Instance

```php
public function hookAfterPageRender($event) {
    $page = $event->object;
    if($page->id == 1) {
        $event->return = str_replace("", "Homepage!", $event->return);
    }
}
```

## Replacing Methods

```php
public function hookBeforePageRender($event) {
    $page = $event->object;
    if($page->template == 'admin') return;
    
    // Tell ProcessWire to replace the method
    $event->replace = true;
    $event->return = "Sorry the site is undergoing maintenance";
}
```

## Creating Hookable Methods

```php
public function ___hookableMethod($arg1, $arg2) {
    // This method is hookable
}

public function regularMethod($arg1, $arg2) {
    // This method is not hookable
}
```

## Adding New Methods via Hooks

```php
public function init() {
    $this->addHook('Page::lastModified', $this, 'lastModified');
}

public function lastModified($event) {
    $page = $event->object;
    if($event->arguments(0) === true) {
        $event->return = wireRelativeTimeStr($page->modified);
    } else {
        $event->return = date('Y-m-d H:i:s', $page->modified);
    }
}

// Usage:
// $page->lastModified(true); // returns "10 minutes ago"
// $page->lastModified(false); // returns "2013-05-15 10:15:12"
```

## Adding New Properties via Hooks

```php
public function init() {
    $this->addHookProperty("User::hello", $this, "hookUserHello");
}

public function hookUserHello($event) {
    $user = $event->object;
    $event->return = "Hello $user->name";
}

// Usage:
// echo $user->hello; // outputs "Hello Karena"
```

## URL/Path Hooks

```php
$wire->addHook('/hello/world', function($event) {
    return 'Hello World';
});

$wire->addHook('/contact/', function($event) {
    return $event->pages->get('/about/contact/');
});
```

## Conditional Hooks

```php
// Basic conditional hook
$wire->addHookAfter('Page(template=order)::changed(order_status)',
    function($event) {
        // Execute when order_status changes on order pages
    }
);

// Multiple conditions
$wire->addHookAfter("Page(template=order)::changed(0:order_status, 1:name=pending, 2:name=delivered)",
    function(HookEvent $event) {
        // Execute when order_status changes from pending to delivered
    }
);

// Match by argument type
$wire->addHook('Pages::saveReady()', function(HookEvent $event) {
    $user = $event->arguments(0);
    $event->message("Saving user: $user->name");
});

// Match by return value
$wire->addHookAfter('Field::getInputfield:(label*=Currency)', function($event) {
    $inputfield = $event->return;
});
```

## Advanced Hook Features

### Hook Priority

```php
$this->addHookAfter('Page::render', $this, 'myHookFunc', [
    'priority' => 200 // Higher number runs later
]);
```

### Hooking Multiple Methods

```php
$wire->addHookAfter('Page::viewable, Page::editable', function($e) {
    $event->message("Called the $e->method hook");
});
```

### Removing Hooks

```php
// Store and remove later
$hookID = $wire->addHook('Inputfield::render', function($e) {
    // Implementation
});
$wire->removeHook($hookID);

// Self-removing hook
$wire->addHook('Inputfield::render', function(HookEvent $e) {
    // Do something once
    $e->removeHook(null);
});
```