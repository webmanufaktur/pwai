# WireData Class

The WireData class extends the Wire class and provides a basic data container with get/set capability for ProcessWire objects.

## Overview

WireData serves as a base class for many ProcessWire objects that need to store and retrieve arbitrary data. It provides methods for getting, setting, and checking data values, as well as tracking changes to those values.

## Common Methods

- `WireData::get($key)` - Get a value by key
- `WireData::set($key, $value)` - Set a value by key
- `WireData::remove($key)` - Remove a value by key
- `WireData::has($key)` - Check if a key exists
- `WireData::getArray()` - Get all data as an array
- `WireData::setArray($data)` - Set multiple values from an array
- `WireData::getFormatted($key)` - Get a formatted value by key
- `WireData::getUnformatted($key)` - Get an unformatted value by key
- `WireData::setTrackChanges($trackChanges = true)` - Set whether to track changes
- `WireData::getChanges($includeFuture = false)` - Get all changes that have occurred
- `WireData::resetTrackChanges()` - Reset all change tracking
- `WireData::trackChange($what)` - Track a change to a property
- `WireData::trackChanges($trackChanges = true)` - Enable or disable change tracking
- `WireData::__get($key)` - Magic method to get a value (allows $obj->key syntax)
- `WireData::__set($key, $value)` - Magic method to set a value (allows $obj->key = $value syntax)
- `WireData::__isset($key)` - Magic method to check if a key exists (allows isset($obj->key) syntax)
- `WireData::__unset($key)` - Magic method to remove a key (allows unset($obj->key) syntax)

## Usage Examples

### Basic Usage

```php
// Create a new WireData object
$data = new WireData();

// Set some values
$data->set('title', 'Hello World');
$data->set('count', 42);

// Alternative syntax for setting values
$data->title = 'Hello World';
$data->count = 42;

// Get values
$title = $data->get('title'); // Returns 'Hello World'
$count = $data->get('count'); // Returns 42

// Alternative syntax for getting values
$title = $data->title; // Returns 'Hello World'
$count = $data->count; // Returns 42

// Check if a key exists
if($data->has('title')) {
    // Do something
}

// Alternative syntax for checking if a key exists
if(isset($data->title)) {
    // Do something
}

// Remove a key
$data->remove('title');

// Alternative syntax for removing a key
unset($data->title);

// Set multiple values at once
$data->setArray([
    'title' => 'New Title',
    'count' => 100,
    'tags' => ['one', 'two', 'three']
]);

// Get all data as an array
$allData = $data->getArray();
```

### Tracking Changes

```php
// Enable change tracking
$data->setTrackChanges(true);

// Set some values
$data->title = 'Original Title';
$data->count = 42;

// Reset change tracking (marks current state as unchanged)
$data->resetTrackChanges();

// Make some changes
$data->title = 'New Title';
$data->count = 100;

// Get the changes
$changes = $data->getChanges(); // Returns ['title', 'count']

// Check if a specific property has changed
if(in_array('title', $changes)) {
    // The title has changed
}
```

### Extending WireData

```php
class MyData extends WireData {
    
    public function __construct() {
        // Initialize with some default values
        $this->setArray([
            'title' => '',
            'count' => 0,
            'enabled' => false
        ]);
        
        // Enable change tracking
        $this->setTrackChanges(true);
    }
    
    // Add custom getter with validation
    public function getCount() {
        $count = $this->get('count');
        return is_numeric($count) ? (int)$count : 0;
    }
    
    // Add custom setter with validation
    public function setCount($count) {
        $count = is_numeric($count) ? (int)$count : 0;
        $this->set('count', $count);
        return $this;
    }
}
```

## Additional Information

WireData is a fundamental class in ProcessWire and is used as the base class for many other classes, including Page, Template, Field, and more. Understanding how it works is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/wire-data/).
