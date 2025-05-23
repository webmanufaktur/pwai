# Primary Core Classes

These are the fundamental classes that form the base of ProcessWire's architecture.

## Wire

The base class that most ProcessWire classes extend.

### Key Methods
- `__get($key)` - Get a property
- `__set($key, $value)` - Set a property
- `set($key, $value)` - Set a property (chainable)
- `get($key)` - Get a property
- `is($property, $value)` - Compare property value

### Example
```php
class MyClass extends Wire {
    public function __construct() {
        $this->set('myProperty', 'default');
    }
}
```

## WireData

Simple data storage class with get/set support.

### Key Methods
- `set($key, $value)` - Set a value
- `get($key)` - Get a value
- `getArray()` - Get all data as array
- `setArray($data)` - Set multiple values from array

### Example
```php
$data = new WireData();
$data->set('name', 'ProcessWire');
echo $data->name; // ProcessWire
```

## WireArray

ArrayObject with powerful filtering and manipulation.

### Key Methods
- `add($item)` - Add an item
- `prepend($item)` - Add to beginning
- `remove($item)` - Remove an item
- `find($selector)` - Find items matching selector
- `filter($selector)` - Filter items
- `sort($field)` - Sort items

### Example
```php
$items = new WireArray();
$items->add(['id' => 1, 'name' => 'Item 1']);
$filtered = $items->find('name=Item 1');
```

## WireSaveableItems

Base class for items that can be saved to the database.

### Key Methods
- `save()` - Save the item
- `delete()` - Delete the item
- `getTableData()` - Get data for database

## Common Patterns

### Creating Custom Classes
```php
class MyItem extends WireData {
    public function __construct() {
        $this->set('title', '');
        $this->set('date', time());
    }
}

// Usage
$item = new MyItem();
$item->title = 'New Item';
$item->save();
```

### Working with WireArray
```php
class MyItems extends WireArray {
    public function getValidItem($item) {
        return $item instanceof MyItem ? $item : null;
    }
}

// Usage
$items = new MyItems();
$items->add(new MyItem());
```
