# $templates API variable / Templates class

Manages and provides access to all the Templates.

In addition to those shown below, the Templates class also inherits all the methods and properties of: WireSaveableItems and Wire.

## Common Methods

- `$templates->add($name)` - Add a new template with the given name. Returns a Template.
- `$templates->clone(Template $item, $name = '')` - Clone a template. Returns a Template.
- `$templates->count($selector = '')` - Count the number of templates matching the given selector. Returns an integer.
- `$templates->delete(Template $item)` - Delete a template. Returns a boolean.
- `$templates->find($selector = '')` - Find templates matching the given selector. Returns a WireArray of Template objects.
- `$templates->get($selector)` - Get a single template by the given selector. Returns a Template or null.
- `$templates->getAll()` - Get all templates. Returns a WireArray of Template objects.
- `$templates->getCache()` - Get the templates cache. Returns an array.
- `$templates->getNew()` - Get a new Template object. Returns a Template.
- `$templates->resetCache()` - Reset the templates cache.
- `$templates->save(Template $item)` - Save a template. Returns a boolean.

## Advanced Methods

- `$templates->getConflicts(Template $template, $field)` - Get conflicts for adding a field to a template. Returns an array.
- `$templates->getExportData(Template $template)` - Get export data for a template. Returns an array.
- `$templates->getFilename($name)` - Get the filename for a template. Returns a string.
- `$templates->getFolders()` - Get all template folders. Returns an array.
- `$templates->getNumPages(Template $template)` - Get the number of pages using a template. Returns an integer.
- `$templates->getPath($filename = '')` - Get the path to the templates directory or a specific template file. Returns a string.
- `$templates->hasField(Template $template, $field)` - Check if a template has a field. Returns a boolean.
- `$templates->setFolders(array $folders)` - Set the template folders. Returns a boolean.

## For Hooks Methods

These methods are only useful for hooking and should not be called directly.

- `$templates->fieldAdded(Template $template, Field $field)` - Hook called after a field is added to a template.
- `$templates->fieldRemoved(Template $template, Field $field)` - Hook called after a field is removed from a template.
- `$templates->fieldSorted(Template $template, Field $field)` - Hook called after fields are sorted in a template.
- `$templates->loaded(Template $template)` - Hook called after a template is loaded.
- `$templates->saved(Template $template, array $changes)` - Hook called after a template is saved.

## Usage Examples

```php
// Get a template by name
$template = $templates->get('basic-page');

// Get a template by ID
$template = $templates->get(42);

// Find templates with a specific selector
$hiddenTemplates = $templates->find('flags=8'); // Find templates with the hidden flag

// Count templates with a specific selector
$count = $templates->count('flags=8');

// Create a new template
$newTemplate = $templates->add('my-template');
$newTemplate->label = 'My Template';
$newTemplate->tags = 'custom';
$newTemplate->fieldgroup = $fieldgroups->get('basic-page'); // Copy fields from another template
$templates->save($newTemplate);

// Clone a template
$originalTemplate = $templates->get('basic-page');
$clonedTemplate = $templates->clone($originalTemplate, 'basic-page-copy');

// Delete a template
$templateToDelete = $templates->get('my-template');
if($templateToDelete->id && $templates->getNumPages($templateToDelete) === 0) {
    $templates->delete($templateToDelete);
}
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/templates/).
