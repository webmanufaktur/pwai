<?php namespace ProcessWire;
/** @var RockMigrations $rm */
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#createfield
$rm->createField('new_field_name', 'template_name', 'FieldtypeText', [
    'label' => 'New Field Label',
    // add other field attributes here
    // e.g., 'tags' => 'CustomFields',
    // 'description' => 'Description for this field',
    // 'notes' => 'Notes for CMS users',
]);
