# WireDatabaseBackup

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/wire-database-backup/)

## Overview

`WireDatabaseBackup` provides methods for creating and restoring database backups within ProcessWire.

## Usage

```php
$backup = new WireDatabaseBackup($database);
$backup->backup();
```

## Common Methods
- `backup()`: Create a database backup.
- `restore($file)`: Restore a backup from a file.

## See Also
- [WireDatabaseBackup Docs](https://processwire.com/api/ref/wire-database-backup/)
