<?php namespace ProcessWire;
/** @var RockMigrations $rm */
// To edit template properties:
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#edittemplate
$rm->editTemplate('existing_template_name', [
    'label' => 'Updated Template Label',
    // 'icon' => 'fa-file-text-o',
]);

// To add a field to the template's fieldgroup:
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#addfieldtotemplate
// $rm->addFieldToTemplate('field_name_to_add', 'existing_template_name');

// To remove a field from the template's fieldgroup:
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#removefieldfromtemplate
// $rm->removeFieldFromTemplate('field_name_to_remove', 'existing_template_name');
