# database()

**ProcessWire API Function**

- [Official Docs](https://processwire.com/api/ref/database/)

## Overview

The `database()` function provides access to the database API object for custom queries and advanced database operations.

## Usage

```php
// Get the Database object
$db = database();

// Run a custom query
$result = database()->query('SELECT * FROM my_table');
```

## Common Methods
- `query($sql)`: Run a SQL query.
- `exec($sql)`: Execute a SQL statement.

## Notes
- Equivalent to using the `$database` API variable.

## See Also
- [$database](./database-variable.md)
