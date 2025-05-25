<?php namespace ProcessWire;
/** @var RockMigrations $rm */
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#createtemplate
$rm->createTemplate('new_template_name', [
    // template properties
    'label' => 'New Template Label',
    // 'tags' => 'CustomTemplates',
    // 'icon' => 'fa-file-o',
    // 'fieldgroups' => [$this->wire->fieldgroups->get('your_fieldgroup_name')], // Example if using existing fieldgroup
], [
    // fields to add to the template by name (will be created if not existing in fieldgroup)
    // 'title', 'body', 'images'
]);
