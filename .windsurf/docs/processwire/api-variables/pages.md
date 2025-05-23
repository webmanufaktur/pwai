# $pages API variable / Pages class

Enables loading and manipulation of Page objects, to and from the database.

In addition to those shown below, the Pages class also inherits all the methods and properties of: Wire.

## Retrieval Methods

- `$pages->count($selector = '', $options = [])` - Count the number of pages matching the given selector.
- `$pages->find($selector, $options = [])` - Find pages matching the given selector. Returns a PageArray.
- `$pages->findIDs($selector, $options = [])` - Find page IDs matching the given selector. Returns an array of IDs.
- `$pages->findJoin($selector, $joinFields, array $options = [])` - Find pages with joined fields. Returns a PageArray.
- `$pages->findMany($selector, array $options = [])` - Find many pages matching the given selector. Returns a PageArray.
- `$pages->findOne($selector, $options = [])` - Find the first page matching the given selector. Returns a Page or NullPage.
- `$pages->findRaw($selector, $field = '', array $options = [])` - Find raw data from pages. Returns an array.
- `$pages->get($selector, array $options = [])` - Get a single page by the given selector. Returns a Page or NullPage.
- `$pages->getByIDs($ids, array $options = [])` - Get pages by their IDs. Returns a PageArray or Page.
- `$pages->getID($selector, $options = [])` - Get a page ID by the given selector. Returns an integer or array.
- `$pages->getInfoByPath(string $path, array $options = [])` - Get page info by path. Returns an array.
- `$pages->has($selector, bool $verbose = false)` - Check if pages exist matching the given selector. Returns an array or integer.

## Creation Methods

- `$pages->add($template, $parent, string $name = '', array $values = [])` - Add a new page. Returns a Page.
- `$pages->clone(Page $page, $parent = null, bool $recursive = true, $options = [])` - Clone a page. Returns a Page or NullPage.
- `$pages->new($selector = '')` - Create a new Page object. Returns a Page.
- `$pages->newPage($options = [])` - Create a new Page object. Returns a Page.

## Manipulation Methods

- `$pages->delete(Page $page, $recursive = false, array $options = [])` - Delete a page. Returns a boolean or integer.
- `$pages->emptyTrash(array $options = [])` - Empty the trash. Returns an integer or array.
- `$pages->restore(Page $page, bool $save = true)` - Restore a page from trash. Returns a boolean.
- `$pages->save(Page $page, array $options = [])` - Save a page. Returns a boolean.
- `$pages->saveField(Page $page, $field, $options = [])` - Save a field on a page. Returns a boolean.
- `$pages->touch($pages, $options = null, string $type = 'modified')` - Touch a page to update its modified time. Returns a boolean.
- `$pages->trash(Page $page, bool $save = true)` - Move a page to the trash. Returns a boolean.

## Advanced Methods

The Pages class also includes methods for:

- Cache
- Helpers
- For hooks

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/pages/).
