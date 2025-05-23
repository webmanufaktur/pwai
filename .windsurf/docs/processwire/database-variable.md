# $database

**ProcessWire API Variable**

- [Official Docs](https://processwire.com/api/ref/database/)

## Overview

The `$database` API variable provides direct access to ProcessWire's database connection, typically a PDO object. It is primarily used for performing custom SQL queries not covered by the core API.

## Usage

```php
// Get the PDO object
$db = $database->getPDO();

// Run a custom query
$result = $database->query('SELECT * FROM my_table');
```

## Common Methods
- `query($sql)`: Run a SQL query.
- `getPDO()`: Get the underlying PDO instance.
- `exec($sql)`: Execute a SQL statement and return the number of affected rows.

## Notes
- Use `$database` only when you need functionality not provided by higher-level ProcessWire APIs.
- Always sanitize user input to prevent SQL injection.

## See Also
- [$config](./config-variable.md)
- [ProcessWire Database API Docs](https://processwire.com/api/ref/database/)
