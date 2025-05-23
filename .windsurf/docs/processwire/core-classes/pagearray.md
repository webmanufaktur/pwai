# PageArray Class

The PageArray class extends the WireArray class and provides a collection of Page objects with additional functionality specific to working with pages.

## Overview

PageArray is used throughout ProcessWire to represent collections of pages. It's what you get when you use methods like `$pages->find()`, `$page->children()`, or `$page->parents()`. It provides methods for filtering, sorting, and manipulating sets of pages.

## Common Methods

### Inherited from WireArray

- `$pageArray->add($page)` - Add a page to the array
- `$pageArray->remove($page)` - Remove a page from the array
- `$pageArray->count()` - Get the number of pages in the array
- `$pageArray->first()` - Get the first page in the array
- `$pageArray->last()` - Get the last page in the array
- `$pageArray->eq($n)` - Get the page at index $n
- `$pageArray->slice($start, $limit = 0)` - Get a slice of the array
- `$pageArray->sort($field, $asc = true)` - Sort the array by a field
- `$pageArray->has($page)` - Check if the array contains a page

### PageArray Specific

- `$pageArray->find($selector)` - Find pages in this array matching the selector
- `$pageArray->filter($selector)` - Filter this array to pages matching the selector
- `$pageArray->not($selector)` - Filter this array to pages NOT matching the selector
- `$pageArray->findOne($selector)` - Find the first page in this array matching the selector
- `$pageArray->getItemKey($page)` - Get the key for a page (usually the ID)
- `$pageArray->getItemProperty($page, $property)` - Get a property from a page
- `$pageArray->explode($delimiter, $property = 'name')` - Explode a property from all pages into an array
- `$pageArray->implode($delimiter, $property = 'name')` - Implode a property from all pages into a string
- `$pageArray->each($callback)` - Execute a callback for each page
- `$pageArray->getRandom()` - Get a random page from the array
- `$pageArray->shuffle()` - Shuffle the array randomly
- `$pageArray->unique()` - Remove duplicate pages from the array
- `$pageArray->prepend($page)` - Add a page to the beginning of the array
- `$pageArray->append($page)` - Add a page to the end of the array
- `$pageArray->shift()` - Remove and return the first page
- `$pageArray->unshift($page)` - Add a page to the beginning of the array
- `$pageArray->pop()` - Remove and return the last page
- `$pageArray->push($page)` - Add a page to the end of the array
- `$pageArray->merge($items)` - Merge another array or PageArray into this one
- `$pageArray->makeNew()` - Create a new empty PageArray
- `$pageArray->makeCopy()` - Create a copy of this PageArray

## Usage Examples

### Basic Usage

```php
// Get a PageArray of children
$children = $page->children();

// Count the number of pages
$count = $children->count();

// Get the first page
$first = $children->first();

// Get the last page
$last = $children->last();

// Get a page by index
$second = $children->eq(1); // Zero-based index

// Check if the array contains a page
if($children->has($somePage)) {
    // The array contains $somePage
}

// Iterate over the pages
foreach($children as $child) {
    echo $child->title . '<br>';
}
```

### Filtering and Finding

```php
// Find pages matching a selector
$matches = $children->find('template=basic-page');

// Filter the array to pages matching a selector
$filtered = $children->filter('template=basic-page');

// Filter the array to pages NOT matching a selector
$notMatches = $children->not('template=basic-page');

// Find the first page matching a selector
$first = $children->findOne('template=basic-page');
```

### Sorting

```php
// Sort by title
$sorted = $children->sort('title');

// Sort by title in descending order
$sortedDesc = $children->sort('title', false);

// Sort by multiple fields
$sorted = $children->sort('template, title');

// Sort randomly
$random = $children->sort('sort=random');
```

### Working with Properties

```php
// Get an array of titles
$titles = $children->explode('|', 'title');

// Get a string of titles
$titleString = $children->implode(', ', 'title');

// Execute a callback for each page
$children->each(function($child) {
    echo $child->title . '<br>';
});
```

### Manipulation

```php
// Create a new empty PageArray
$newArray = $children->makeNew();

// Create a copy of a PageArray
$copy = $children->makeCopy();

// Add a page to the array
$children->add($newPage);

// Remove a page from the array
$children->remove($pageToRemove);

// Get a random page
$randomPage = $children->getRandom();

// Shuffle the array
$shuffled = $children->shuffle();

// Remove duplicates
$unique = $children->unique();

// Merge with another PageArray
$merged = $children->merge($otherChildren);
```

## Pagination

PageArray supports pagination through the PaginatedArray class:

```php
// Get a paginated array of children
$items = $page->children('limit=10');

// Get pagination information
$total = $items->getTotal(); // Total number of items (without limit)
$limit = $items->getLimit(); // Items per page
$start = $items->getStart(); // Starting item number
$end = $items->getEnd(); // Ending item number

// Check if there are more pages
if($items->getMore()) {
    // There are more pages
}

// Get the current page number
$pageNum = $items->getPaginationNumber();

// Get the total number of pages
$totalPages = $items->getPaginationTotal();

// Get a MarkupPagerNav for rendering pagination
$pager = $items->renderPager();
```

## Additional Information

PageArray is one of the most commonly used classes in ProcessWire, as it represents collections of pages throughout the system. Understanding how to work with PageArrays is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/page-array/).
