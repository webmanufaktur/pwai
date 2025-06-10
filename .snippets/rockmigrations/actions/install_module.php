<?php namespace ProcessWire;
/** @var RockMigrations $rm */
// Docs: https://github.com/baumrock/RockMigrations/wiki/Methods#installmodule
$rm->installModule('ModuleName', [
    // optional: config data to set during installation
    // 'setting_name' => 'value',
], 'version_string'); // optional: version string, e.g., '1.0.0'
