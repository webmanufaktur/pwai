# WireArray Class

The WireArray class extends the ArrayObject class and provides a base array-like data container for ProcessWire objects.

## Overview

WireArray serves as a base class for many ProcessWire array-like objects, such as PageArray, FieldsArray, and more. It provides methods for manipulating, filtering, and traversing collections of Wire objects.

## Common Methods

### Array Manipulation

- `WireArray::add($item)` - Add an item to the array
- `WireArray::remove($item)` - Remove an item from the array
- `WireArray::replace($oldItem, $newItem)` - Replace an item with another
- `WireArray::insert($item, $before = null)` - Insert an item before another
- `WireArray::insertAfter($item, $after = null)` - Insert an item after another
- `WireArray::insertBefore($item, $before = null)` - Insert an item before another
- `WireArray::prepend($item)` - Add an item to the beginning of the array
- `WireArray::append($item)` - Add an item to the end of the array
- `WireArray::shift()` - Remove and return the first item
- `WireArray::unshift($item)` - Add an item to the beginning of the array
- `WireArray::pop()` - Remove and return the last item
- `WireArray::push($item)` - Add an item to the end of the array
- `WireArray::slice($start, $limit = 0)` - Get a slice of the array
- `WireArray::chunk($num)` - Split the array into chunks of size $num
- `WireArray::merge($items)` - Merge another array or WireArray into this one
- `WireArray::makeNew()` - Create a new empty instance of this WireArray
- `WireArray::makeCopy()` - Create a copy of this WireArray

### Filtering and Finding

- `WireArray::find($selector)` - Find items matching the given selector
- `WireArray::filter($selector)` - Filter items to those matching the given selector
- `WireArray::not($selector)` - Filter items to those NOT matching the given selector
- `WireArray::findOne($selector)` - Find the first item matching the given selector
- `WireArray::eq($num)` - Get the item at the given index
- `WireArray::first()` - Get the first item
- `WireArray::last()` - Get the last item
- `WireArray::sort($field, $asc = true)` - Sort the array by the given field
- `WireArray::sortRandom()` - Sort the array randomly

### Information

- `WireArray::count()` - Get the number of items in the array
- `WireArray::getIterator()` - Get an iterator for the array
- `WireArray::getItemKey($item)` - Get the key for the given item
- `WireArray::getItemLabel($item)` - Get a label for the given item
- `WireArray::getItemProperty($item, $property)` - Get a property from the given item
- `WireArray::getProperty($property)` - Get a property from all items
- `WireArray::explode($delimiter, $property = 'name')` - Explode a property from all items into an array
- `WireArray::implode($delimiter, $property = 'name')` - Implode a property from all items into a string
- `WireArray::each($callback)` - Execute a callback for each item
- `WireArray::has($item)` - Check if the array has the given item
- `WireArray::hasProperty($property)` - Check if all items have the given property
- `WireArray::isEmpty()` - Check if the array is empty

## Usage Examples

### Basic Usage

```php
// Create a new WireArray
$array = new WireArray();

// Add some items
$array->add($item1);
$array->add($item2);
$array->add($item3);

// Alternative syntax for adding items
$array[] = $item4;

// Get the number of items
$count = $array->count();

// Iterate over the items
foreach($array as $item) {
    // Do something with $item
}

// Get the first item
$first = $array->first();

// Get the last item
$last = $array->last();

// Get an item by index
$second = $array->eq(1); // Zero-based index

// Check if the array has an item
if($array->has($item2)) {
    // The array has $item2
}

// Remove an item
$array->remove($item2);

// Sort the array by a property
$array->sort('name');

// Sort the array randomly
$array->sortRandom();
```

### Filtering and Finding

```php
// Find items matching a selector
$matches = $array->find('name=foo');

// Filter the array to items matching a selector
$filtered = $array->filter('name=foo');

// Filter the array to items NOT matching a selector
$notMatches = $array->not('name=foo');

// Find the first item matching a selector
$first = $array->findOne('name=foo');
```

### Working with Properties

```php
// Get a property from all items
$names = $array->getProperty('name');

// Implode a property from all items into a string
$nameString = $array->implode(', ', 'name');

// Explode a property from all items into an array
$nameArray = $array->explode(',', 'tags');

// Execute a callback for each item
$array->each(function($item) {
    $item->doSomething();
});
```

### Creating a Subclass

```php
class MyArray extends WireArray {
    
    // Specify what type of items this array can contain
    public function isValidItem($item) {
        return $item instanceof MyItem;
    }
    
    // Specify how to get a key for an item
    public function getItemKey($item) {
        return $item->id;
    }
    
    // Add a custom method
    public function findByCategory($category) {
        return $this->find("category=$category");
    }
}
```

## Additional Information

WireArray is a fundamental class in ProcessWire and is used as the base class for many collection classes, including PageArray, FieldsArray, and more. Understanding how it works is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/wire-array/).
