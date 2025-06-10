# Wire Class

The Wire class is the base class that all ProcessWire classes inherit from. It provides the foundation for ProcessWire's hook system, which enables events, filters, and modifications to any method in any class that extends Wire.

## Overview

The Wire class provides the following core functionality:

1. **Hook System** - Allows methods to be extended or modified without changing the original code
2. **Event Handling** - Enables triggering and responding to events
3. **Error Handling** - Provides methods for handling errors and exceptions
4. **Identification** - Provides unique identification for objects

## Common Methods

- `Wire::addHook($method, $toObject, $toMethod = null, $options = array())` - Add a hook to a method
- `Wire::removeHook($hook)` - Remove a previously added hook
- `Wire::hasHook($method)` - Check if a method has any hooks
- `Wire::runHooks($method, $arguments)` - Run hooks for a method
- `Wire::getHooks($method = '')` - Get all hooks for a method or all methods
- `Wire::hookMethod($method, $toObject, $toMethod = null, $options = array())` - Hook a method (alias for addHook)
- `Wire::hookProperty($property, $toObject, $toMethod = null, $options = array())` - Hook a property
- `Wire::id()` - Get the unique ID of this object
- `Wire::className($withNamespace = false)` - Get the class name of this object
- `Wire::wire($name = '')` - Get a ProcessWire API variable
- `Wire::setTrackChanges($trackChanges = true)` - Set whether to track changes to this object
- `Wire::trackChange($what)` - Track a change to a property
- `Wire::trackChanges($trackChanges = true)` - Enable or disable change tracking
- `Wire::getChanges($includeFuture = false)` - Get all changes that have occurred
- `Wire::resetTrackChanges()` - Reset all change tracking
- `Wire::message($text, $flags = 0)` - Add a message
- `Wire::error($text, $flags = 0)` - Add an error message
- `Wire::warning($text, $flags = 0)` - Add a warning message

## Hook Options

When adding a hook, the following options can be specified:

- `type` - The type of hook (before, after, replace)
- `priority` - The priority of the hook (lower numbers execute first)
- `allInstances` - Whether the hook applies to all instances of the class
- `fromClass` - The class that the hook is coming from
- `argMatch` - Arguments that must match for the hook to execute
- `argTest` - A test function for arguments
- `objMatch` - Object properties that must match for the hook to execute

## Usage Examples

### Adding a Hook

```php
// Add a hook to modify the return value of a method
$wire->addHook('Page::render', function(HookEvent $event) {
    $page = $event->object;
    $content = $event->return;
    $event->return = "<div class='page'>$content</div>";
});

// Add a hook to modify arguments before a method is called
$wire->addHook('Page::setAndSave', function(HookEvent $event) {
    $name = $event->arguments(0);
    $value = $event->arguments(1);
    
    // Modify the value before it's saved
    if($name == 'title') {
        $value = strtoupper($value);
        $event->arguments(1, $value);
    }
}, array('type' => 'before'));
```

### Creating a Class that Extends Wire

```php
class MyClass extends Wire {
    
    public function myMethod($arg1, $arg2) {
        // This method can now be hooked
        return "Result: $arg1, $arg2";
    }
    
    public function __construct() {
        // Enable change tracking
        $this->setTrackChanges(true);
    }
    
    public function setProperty($value) {
        $old = $this->property;
        $this->property = $value;
        
        // Track the change
        if($old !== $value) {
            $this->trackChange('property');
        }
        
        return $this;
    }
}
```

## Additional Information

The Wire class is the foundation of ProcessWire's API and is used throughout the system. Understanding how it works is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/wire/).
