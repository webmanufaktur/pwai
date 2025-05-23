# ProcessWire Documentation

Welcome to the ProcessWire documentation! This directory contains comprehensive guides and references for working with ProcessWire CMS/CMF.

## Table of Contents

1. [API Variables](./api-variables.md)
2. [Core Classes](./core-classes/README.md)
   - [Primary Classes](./core-classes/primary.md)
   - [Pages](./core-classes/pages.md)
   - [Fields & Templates](./core-classes/fields-templates.md)
3. [Functions](./functions.md)
4. [Modules](./modules.md)
5. [Examples](./examples/README.md)
   - [Basic Usage](./examples/basic-usage.md)
   - [Common Patterns](./examples/common-patterns.md)
6. [Best Practices](./best-practices.md)
7. [Troubleshooting](./troubleshooting.md)

## Quick Start

```php
// Get the current page
$page = wire('page');

// Find pages
$recentPages = $pages->find("template=blog, sort=-created, limit=5");

// Output content
foreach($recentPages as $item) {
    echo "<h2>{$item->title}</h2>";
    echo $item->summary;
}
```
