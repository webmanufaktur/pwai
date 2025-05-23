# $page API variable / Page class

Class used by all Page objects in ProcessWire.

The $page API variable represents the current page being viewed. However, the documentation here also applies to all Page objects that you may work with in the API. We use $page as the most common example throughout the documentation, but you can substitute that with any variable name representing a Page.

In addition to those shown below, the Page class also inherits all the methods and properties of: WireData and Wire.

## Common Methods

- `$page->child($selector = '', array $options = [])` - Returns the first child page matching the given selector. Returns a Page or NullPage.
- `$page->children(string $selector = '', array $options = [])` - Returns the child pages matching the given selector. Returns a PageArray.
- `$page->find($selector = '', array $options = [])` - Find pages matching the given selector. Returns a PageArray.
- `$page->findOne($selector = '', array $options = [])` - Find the first page matching the given selector. Returns a Page or NullPage.
- `$page->get(string $key)` - Get the value of a field or property from the page.
- `$page->getMultiple($keys, bool $assoc = false)` - Get multiple field values as an array.
- `$page->hasChildren($selector = true)` - Returns the number of children, or boolean when given a selector.
- `$page->hasFile(string $file, array $options = [])` - Returns whether the page has the given file.
- `$page->hasStatus($status)` - Returns whether the page has the given status.
- `$page->httpUrl(array $options = [])` - Returns the HTTP URL to the page.
- `$page->if($key, $yes = '', $no = '')` - Shorthand for an if statement with a field.
- `$page->numChildren($selector = null)` - Returns the number of children.
- `$page->numParents(string $selector = '')` - Returns the number of parents.
- `$page->of(bool $outputFormatting = null)` - Returns or sets the output formatting state.
- `$page->parent($selector = '')` - Returns the parent page, optionally matching a selector.
- `$page->parents($selector = '')` - Returns all parent pages, optionally matching a selector.
- `$page->path()` - Returns the path to the page.
- `$page->preload(array $fieldNames = [], array $options = [])` - Preload the given fields for this page.
- `$page->rootParent()` - Returns the root parent page.
- `$page->save($field = null, array $options = [])` - Save the page to the database.
- `$page->saveFields($fields, array $options = [])` - Save specific fields to the database.
- `$page->set(string $key, mixed $value)` - Set a field or property value.
- `$page->template($template = null)` - Get or set the template.
- `$page->url($options = null)` - Returns the URL to the page.

## Traversal Methods

- `$page->child($selector = '', array $options = [])` - Returns the first child page matching the given selector.
- `$page->children(string $selector = '', array $options = [])` - Returns the child pages matching the given selector.
- `$page->closest($selector)` - Returns the closest parent page matching the selector.
- `$page->find($selector = '', array $options = [])` - Find pages matching the given selector.
- `$page->findOne($selector = '', array $options = [])` - Find the first page matching the given selector.
- `$page->hasChildren($selector = true)` - Returns the number of children, or boolean when given a selector.
- `$page->index($selector = '')` - Returns the index/position of this page among its siblings.
- `$page->links($selector = '', $field = '')` - Returns pages that are linked to by this page.
- `$page->matches($s)` - Returns whether this page matches the given selector.
- `$page->matchesDatabase($s)` - Returns whether this page matches the given selector in the database.
- `$page->next($selector = '', PageArray $siblings = null)` - Returns the next sibling page.
- `$page->nextAll($selector = '', $getQty = false, bool $getPrev = false)` - Returns all next sibling pages.
- `$page->nextUntil($selector = '', $filter = '', PageArray $siblings = null)` - Returns all next sibling pages until the given selector is matched.
- `$page->numChildren($selector = null)` - Returns the number of children.
- `$page->numDescendants($selector = null)` - Returns the number of descendants.
- `$page->parent($selector = '')` - Returns the parent page, optionally matching a selector.
- `$page->parents($selector = '')` - Returns all parent pages, optionally matching a selector.
- `$page->parentsUntil($selector = '', $filter = '')` - Returns all parent pages until the given selector is matched.
- `$page->prev($selector = '', $siblings = null)` - Returns the previous sibling page.
- `$page->prevAll($selector = '', $getQty = false)` - Returns all previous sibling pages.

## Additional Categories

The Page class also includes methods for:

- Manipulation
- Date time
- Access
- Output rendering
- Status
- Languages
- System
- Advanced
- For hooks
- Urls
- Files
- Previous
- Users

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/page/).
