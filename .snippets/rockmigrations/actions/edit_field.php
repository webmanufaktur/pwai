<?php namespace ProcessWire;
/** @var RockMigrations $rm */
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#editfield
$rm->editField('existing_field_name', 'template_name', [
    'label' => 'Updated Field Label',
    // add other field attributes to change here
    // e.g., 'description' => 'Updated description',
]);
