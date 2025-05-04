# $fields API variable / Fields class

Manages all custom fields in ProcessWire, independently of any Fieldgroup.

Each field returned is an object of type Field. The $fields API variable is iterable:

```php
foreach($fields as $field) {
  echo "<p>Name: $field->name, Type: $field->type, Label: $field->label</p>";
}
```

In addition to those shown below, the Fields class also inherits all the methods and properties of: WireSaveableItems and Wire.

## Common Methods

- `$fields->clone(Field $item, string $name = '')` - Clone a field. Returns a Field.
- `$fields->delete(Field $item)` - Delete a field. Returns a boolean.
- `$fields->findByTag(string $tag, bool $getFieldNames = false)` - Find fields with the given tag. Returns an array.
- `$fields->findByType($type, array $options = [])` - Find fields of the given type. Returns an array of Field objects.
- `$fields->get($name)` - Get a field by name. Returns a Field or null.
- `$fields->getAllNames(string $indexType = '')` - Get all field names. Returns an array.
- `$fields->getNumPages(Field $field, array $options = [])` - Get the number of pages using a field. Returns an integer or array.
- `$fields->getNumRows(Field $field, array $options = [])` - Get the number of database rows for a field. Returns an integer or array.
- `$fields->getWireArray()` - Get a WireArray of all fields. Returns a WireArray.
- `$fields->isNative(string $name)` - Check if a field name is native to ProcessWire. Returns a boolean.
- `$fields->makeItem(array $a = [])` - Create a new field from an array. Returns a Saveable or Wire object.
- `$fields->save(Field $item)` - Save a field. Returns a boolean.

## Advanced Methods

- `$fields->getTags($getFieldNames = false)` - Get all tags used by fields. Returns an array.
- `$fields->saveFieldgroupContext(Field $field, Fieldgroup $fieldgroup, string $namespace = '')` - Save field context for a fieldgroup. Returns a boolean.

## For Hooks Methods

These methods are only useful for hooking and should not be called directly.

- `$fields->changeFieldtype(Field $field1, bool $keepSettings = false)` - Change the fieldtype of a field. Returns a boolean.
- `$fields->changeTypeReady(Field $item, Fieldtype $fromType, Fieldtype $toType)` - Hook called before changing a field's type.
- `$fields->changedType(Field $item, Fieldtype $fromType, Fieldtype $toType)` - Hook called after changing a field's type.
- `$fields->deleteFieldDataByTemplate(Field $field, Template $template)` - Delete field data for a template. Returns a boolean.

## Usage Examples

```php
// Get a field by name
$field = $fields->get('title');

// Find fields of a specific type
$imageFields = $fields->findByType('FieldtypeImage');

// Find fields with a specific tag
$taggedFields = $fields->findByTag('gallery');

// Create a new field
$newField = $fields->makeItem();
$newField->name = 'my_field';
$newField->type = $modules->get('FieldtypeText');
$newField->label = 'My Field';
$fields->save($newField);

// Clone a field
$originalField = $fields->get('title');
$clonedField = $fields->clone($originalField, 'title_copy');

// Delete a field
$fieldToDelete = $fields->get('my_field');
$fields->delete($fieldToDelete);
```

For complete documentation, visit the [official ProcessWire documentation](https://processwire.com/api/ref/fields/).
