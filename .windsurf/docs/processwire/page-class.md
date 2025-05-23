# Page Class

The Page class is the fundamental content type in ProcessWire, representing a single page in the site's hierarchy.

## Overview

Every piece of content in ProcessWire is a Page. Pages can represent web pages, blog posts, products, users, or any other type of content. Each Page has a template that defines what fields it contains, and each field stores a specific type of data.

The Page class extends WireData and inherits all its methods and properties, as well as those from Wire.

## Common Methods

### Basic Properties and Methods

- `$page->id` - The page's ID
- `$page->name` - The page's name (used in URLs)
- `$page->title` - The page's title
- `$page->path` - The page's path
- `$page->url` - The page's URL
- `$page->template` - The page's template
- `$page->parent` - The page's parent
- `$page->parents` - The page's parents (ancestors)
- `$page->children` - The page's children
- `$page->numChildren` - The number of children
- `$page->siblings` - The page's siblings
- `$page->next` - The next sibling
- `$page->prev` - The previous sibling
- `$page->rootParent` - The root parent (top-level ancestor)
- `$page->createdUser` - The user who created the page
- `$page->created` - When the page was created
- `$page->modifiedUser` - The user who last modified the page
- `$page->modified` - When the page was last modified
- `$page->published` - When the page was published
- `$page->status` - The page's status (published, hidden, etc.)
- `$page->get(string $key)` - Get a field or property value
- `$page->set(string $key, mixed $value)` - Set a field or property value
- `$page->save($field = null, array $options = [])` - Save the page to the database
- `$page->delete()` - Delete the page

### Traversal Methods

- `$page->child($selector = '', array $options = [])` - Get a child page
- `$page->children(string $selector = '', array $options = [])` - Get child pages
- `$page->find($selector = '', array $options = [])` - Find pages
- `$page->findOne($selector = '', array $options = [])` - Find one page
- `$page->parent($selector = '')` - Get the parent page
- `$page->parents($selector = '')` - Get parent pages
- `$page->rootParent()` - Get the root parent page
- `$page->siblings($selector = '')` - Get sibling pages
- `$page->next($selector = '', PageArray $siblings = null)` - Get the next sibling
- `$page->prev($selector = '', $siblings = null)` - Get the previous sibling
- `$page->nextAll($selector = '', $getQty = false, bool $getPrev = false)` - Get all next siblings
- `$page->prevAll($selector = '', $getQty = false)` - Get all previous siblings
- `$page->index($selector = '')` - Get the page's index among its siblings

### Status Methods

- `$page->isPublished()` - Check if the page is published
- `$page->isHidden()` - Check if the page is hidden
- `$page->isTrash()` - Check if the page is in the trash
- `$page->isLocked()` - Check if the page is locked
- `$page->hasStatus($status)` - Check if the page has a specific status
- `$page->addStatus($status)` - Add a status to the page
- `$page->removeStatus($status)` - Remove a status from the page
- `$page->publish()` - Publish the page
- `$page->unpublish()` - Unpublish the page
- `$page->trash()` - Move the page to the trash
- `$page->restore()` - Restore the page from the trash
- `$page->lock()` - Lock the page
- `$page->unlock()` - Unlock the page

### Access Methods

- `$page->viewable()` - Check if the page is viewable by the current user
- `$page->editable()` - Check if the page is editable by the current user
- `$page->publishable()` - Check if the page is publishable by the current user
- `$page->listable()` - Check if the page is listable by the current user
- `$page->deleteable()` - Check if the page is deleteable by the current user
- `$page->addable($template)` - Check if the current user can add children with the given template
- `$page->moveable($newParent)` - Check if the page is moveable to the given parent by the current user
- `$page->sortable()` - Check if the page is sortable by the current user

## Usage Examples

### Basic Usage

```php
// Get a page by ID
$page = $pages->get(123);

// Get a page by path
$page = $pages->get('/about/team/');

// Get a field value
$title = $page->title;
$body = $page->body;

// Set a field value
$page->title = 'New Title';
$page->body = 'New body text';

// Save the page
$page->save();

// Delete the page
$page->delete();
```

### Traversal

```php
// Get the parent
$parent = $page->parent;

// Get all parents (ancestors)
$parents = $page->parents;

// Get the root parent
$root = $page->rootParent;

// Get children
$children = $page->children;

// Get children with a selector
$visibleChildren = $page->children('status<hidden');

// Get a specific child
$firstChild = $page->child;
$namedChild = $page->child('name=contact');

// Get siblings
$siblings = $page->siblings;

// Get the next sibling
$next = $page->next;

// Get the previous sibling
$prev = $page->prev;

// Find pages within this page
$results = $page->find('template=basic-page, sort=title');

// Find a specific page within this page
$result = $page->findOne('name=contact');
```

### Status and Access

```php
// Check if the page is published
if($page->isPublished()) {
    // Page is published
}

// Check if the page is hidden
if($page->isHidden()) {
    // Page is hidden
}

// Check if the page is in the trash
if($page->isTrash()) {
    // Page is in the trash
}

// Check if the current user can view the page
if($page->viewable()) {
    // User can view the page
}

// Check if the current user can edit the page
if($page->editable()) {
    // User can edit the page
}

// Check if the current user can delete the page
if($page->deleteable()) {
    // User can delete the page
}
```

### Working with Fields

```php
// Get a field value
$title = $page->get('title');
$body = $page->get('body');

// Set a field value
$page->set('title', 'New Title');
$page->set('body', 'New body text');

// Check if a field exists
if($page->has('body')) {
    // Page has a body field
}

// Get multiple field values
$values = $page->getMultiple(['title', 'body', 'date']);

// Save a specific field
$page->save('title');

// Save multiple fields
$page->saveFields(['title', 'body']);
```

## Additional Information

The Page class is the most fundamental and frequently used class in ProcessWire. Understanding how to work with pages is essential for developing with ProcessWire.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/page/).
