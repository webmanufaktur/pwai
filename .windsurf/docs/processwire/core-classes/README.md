# Core Classes

This section documents the core classes in ProcessWire that you'll work with most frequently.

## Table of Contents

1. [Primary Classes](./primary.md)
2. [Pages](./pages.md)
3. [Fields & Templates](./fields-templates.md)
4. [Modules](./modules.md)

## Overview

ProcessWire's architecture is built around several core classes that provide the foundation for all functionality:

- **Primary Classes**: Base classes that provide core functionality
- **Pages**: Classes for working with pages and page collections
- **Fields & Templates**: Classes for managing content structure
- **Modules**: Extend and enhance ProcessWire's functionality

## Common Patterns

### Page Object Access
```php
// Get a page by ID
$p = $pages->get(1015);

// Get multiple pages
$items = $pages->find("template=basic-page");

// Get child pages
$children = $page->children();
```

### Field Access
```php
// Get field value
$title = $page->title;

// Get formatted date
$date = $page->getFormatted('date');

// Get image URL
$image = $page->image->size(400, 300)->url;
```
