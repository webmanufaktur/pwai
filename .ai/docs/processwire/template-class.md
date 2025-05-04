# Template Class

The Template class represents a template in ProcessWire, defining the structure and behavior of pages.

## Overview

Templates in ProcessWire define what fields are available to pages, as well as various settings that control how pages using the template behave. Each template has exactly one fieldgroup, which defines what fields are available to pages using that template.

## Common Properties

- `$template->id` - The template's ID
- `$template->name` - The template's name
- `$template->label` - The template's label
- `$template->tags` - Tags associated with the template
- `$template->fieldgroup` - The fieldgroup used by the template
- `$template->fields` - The fields in the template's fieldgroup
- `$template->roles` - Roles that can access pages using this template
- `$template->useRoles` - Whether the template uses role-based access control
- `$template->editRoles` - Roles that can edit pages using this template
- `$template->addRoles` - Roles that can add pages using this template
- `$template->createRoles` - Roles that can create pages using this template
- `$template->childrenTemplates` - Templates allowed for child pages
- `$template->parentTemplates` - Templates allowed for parent pages
- `$template->sortfield` - Field to sort pages by
- `$template->noChildren` - Whether pages using this template can have children
- `$template->noParents` - Whether pages using this template can have parents
- `$template->allowPageNum` - Whether pages using this template allow pagination
- `$template->allowChangeUser` - Whether pages using this template allow changing the user
- `$template->redirectLogin` - Whether to redirect to login page for protected pages
- `$template->urlSegments` - Whether pages using this template allow URL segments
- `$template->https` - Whether pages using this template require HTTPS
- `$template->slashUrls` - Whether pages using this template have trailing slashes in URLs
- `$template->altFilename` - Alternate filename for the template file
- `$template->flags` - Flags for the template
- `$template->cache_time` - Cache time for pages using this template
- `$template->noCacheGetVars` - GET variables that disable caching
- `$template->noCachePostVars` - POST variables that disable caching
- `$template->useCacheForUsers` - Whether to use cache for logged-in users
- `$template->cacheExpire` - When the cache expires
- `$template->nameContentTab` - Name of the content tab
- `$template->contentType` - Content type for pages using this template
- `$template->errorAction` - Action to take on 404 errors

## Common Methods

- `$template->fieldgroup()` - Get or set the fieldgroup
- `$template->fields()` - Get the fields in the template's fieldgroup
- `$template->hasField($field)` - Check if the template has a field
- `$template->hasFieldContext($field)` - Check if the template has a context for a field
- `$template->getField($field)` - Get a field from the template
- `$template->getFields()` - Get all fields in the template
- `$template->getFieldgroup()` - Get the fieldgroup
- `$template->getFieldContextArray($field)` - Get the context array for a field
- `$template->setFieldContextArray($field, array $data)` - Set the context array for a field
- `$template->fieldContexts($field = null)` - Get or set field contexts
- `$template->getFilename()` - Get the filename for the template file
- `$template->getFlags()` - Get the flags for the template
- `$template->hasFlag($flag)` - Check if the template has a flag
- `$template->addFlag($flag)` - Add a flag to the template
- `$template->removeFlag($flag)` - Remove a flag from the template
- `$template->getRoles()` - Get the roles that can access pages using this template
- `$template->addRole($role)` - Add a role to the template
- `$template->removeRole($role)` - Remove a role from the template
- `$template->hasRole($role)` - Check if the template has a role
- `$template->getChildrenTemplates()` - Get templates allowed for child pages
- `$template->setChildrenTemplates($templates)` - Set templates allowed for child pages
- `$template->addChildTemplate($template)` - Add a template allowed for child pages
- `$template->removeChildTemplate($template)` - Remove a template allowed for child pages
- `$template->hasChildTemplate($template)` - Check if a template is allowed for child pages
- `$template->getParentTemplates()` - Get templates allowed for parent pages
- `$template->setParentTemplates($templates)` - Set templates allowed for parent pages
- `$template->addParentTemplate($template)` - Add a template allowed for parent pages
- `$template->removeParentTemplate($template)` - Remove a template allowed for parent pages
- `$template->hasParentTemplate($template)` - Check if a template is allowed for parent pages
- `$template->isFamily($template)` - Check if a template is in the same family
- `$template->isAllowedNewParent($parent)` - Check if a parent is allowed for new pages
- `$template->isAllowedExistingParent($parent)` - Check if a parent is allowed for existing pages
- `$template->isAllowedFamily($family)` - Check if a family is allowed
- `$template->isAllowedChildTemplates($templates)` - Check if child templates are allowed
- `$template->isAllowedParentTemplates($templates)` - Check if parent templates are allowed
- `$template->getNumPages()` - Get the number of pages using this template
- `$template->getPages($selector = '')` - Get pages using this template
- `$template->isGlobal()` - Check if the template is global
- `$template->isInternal()` - Check if the template is internal
- `$template->isSystem()` - Check if the template is a system template
- `$template->isReserved()` - Check if the template is reserved
- `$template->isVersioned()` - Check if the template is versioned
- `$template->isUsableInContext($context)` - Check if the template is usable in a context
- `$template->isUsableForChildren($parent)` - Check if the template is usable for children
- `$template->isUsableForParent($child)` - Check if the template is usable for a parent
- `$template->isDeleteable()` - Check if the template is deleteable

## Usage Examples

### Creating a Template

```php
// Create a new template
$template = new Template();
$template->name = 'my-template';
$template->label = 'My Template';
$template->tags = 'custom, page';

// Set the fieldgroup
$template->fieldgroup = $fieldgroups->get('my-fieldgroup');

// Set access control
$template->useRoles = true;
$template->editRoles = [$roles->get('editor')];
$template->addRoles = [$roles->get('editor')];
$template->createRoles = [$roles->get('superuser')];

// Set family settings
$template->noChildren = false;
$template->noParents = false;
$template->childrenTemplates = [$templates->get('basic-page')->id];
$template->parentTemplates = [$templates->get('home')->id];

// Set URL settings
$template->allowPageNum = true;
$template->urlSegments = true;
$template->https = false;
$template->slashUrls = true;

// Set cache settings
$template->cache_time = 3600;
$template->useCacheForUsers = false;

// Save the template
$templates->save($template);
```

### Modifying a Template

```php
// Get an existing template
$template = $templates->get('basic-page');

// Modify the template
$template->label = 'Basic Page (Modified)';
$template->tags = 'modified, page';

// Modify access control
$template->useRoles = true;
$template->editRoles = [$roles->get('editor')];
$template->addRoles = [$roles->get('editor')];

// Modify family settings
$template->childrenTemplates = [$templates->get('basic-page')->id];
$template->parentTemplates = [$templates->get('home')->id];

// Modify URL settings
$template->allowPageNum = true;
$template->urlSegments = true;

// Modify cache settings
$template->cache_time = 7200;

// Save the template
$templates->save($template);
```

### Working with Fields

```php
// Get a template
$template = $templates->get('basic-page');

// Check if the template has a field
if($template->hasField('title')) {
    // Template has the title field
}

// Get a field from the template
$field = $template->getField('title');

// Get all fields in the template
$fields = $template->getFields();

// Get the fieldgroup
$fieldgroup = $template->getFieldgroup();

// Add a field to the template
$fieldgroup->add($fields->get('my_field'));
$templates->save($template);

// Remove a field from the template
$fieldgroup->remove($fields->get('my_field'));
$templates->save($template);
```

### Working with Roles and Access Control

```php
// Get a template
$template = $templates->get('basic-page');

// Enable role-based access control
$template->useRoles = true;

// Set roles that can edit pages using this template
$template->editRoles = [$roles->get('editor')];

// Set roles that can add pages using this template
$template->addRoles = [$roles->get('editor')];

// Set roles that can create pages using this template
$template->createRoles = [$roles->get('superuser')];

// Add a role to the template
$template->addRole($roles->get('editor'));

// Remove a role from the template
$template->removeRole($roles->get('editor'));

// Check if the template has a role
if($template->hasRole('editor')) {
    // Template has the editor role
}

// Save the template
$templates->save($template);
```

## Additional Information

Templates are a fundamental part of ProcessWire's content management system. They define the structure and behavior of pages, and they work together with fieldgroups and fields to create a flexible and powerful content model.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/template/).
