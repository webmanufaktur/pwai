<?php
/**
 * ProcessWire Migrations Loader
 * 
 * This file loads all migration files from the /site/migrations/ directory.
 * RockMigrations will automatically watch and execute these files.
 */

// Include all PHP files from the migrations directory
foreach (glob(__DIR__ . '/migrations/*.php') as $migration) {
    require_once $migration;
}
