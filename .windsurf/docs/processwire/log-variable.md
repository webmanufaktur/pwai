# $log API Variable

The `$log` API variable provides logging functionality in ProcessWire.

## Overview

- **Type**: `WireLog`
- **Purpose**: System and application logging
- **Availability**: Always available in templates and modules

## Basic Usage

### Writing Log Entries

```php
// Basic log entry
$log->save('log-name', 'This is a log message');

// With additional data
$log->save('log-name', 'User action', ['user_id' => $user->id]);
```

### Log Levels

ProcessWire supports several log levels:

```php
// Different log levels
$log->error('error', 'Critical error occurred');
$log->warning('warnings', 'Potential issue detected');
$log->message('notices', 'Informational message');
```

## Common Methods

### save($name, $text, $options = [])
Save a message to the named log file.

**Parameters:**
- `$name` (string): Log name (creates name.txt in site/assets/logs/)
- `$text` (string): Message to log
- `$options` (array): Additional options
  - `showUser` (bool): Include username (default: true)
  - `url` (string): URL to include in log
  - `urlLabel` (string): Label for URL
  - `delimiter` (string): Field delimiter (default: "\t")
  - `fileExtension` (string): File extension (default: "txt")

**Example:**
```php
$log->save('my-log', 'User performed action', [
    'showUser' => true,
    'url' => $page->url
]);
```

### getEntries($name, $options = [])
Get log entries from a log file.

**Parameters:**
- `$name` (string): Log name
- `$options` (array): Options for getting entries
  - `reverse` (bool): Reverse sort order (default: true)
  - `limit` (int): Maximum entries to return
  - `from` (string): Start date (strtotime format)
  - `to` (string): End date (strtotime format)
  - `contains` (string): Only return entries containing this text

**Example:**
```php
$entries = $log->getEntries('my-log', [
    'limit' => 10,
    'contains' => 'error'
]);
```

## Best Practices

1. **Log Naming**
   - Use consistent, descriptive names
   - Group related logs with prefixes (e.g., 'api-', 'payment-')

2. **Log Rotation**
   - Monitor log file sizes
   - Implement log rotation for production environments

3. **Sensitive Information**
   - Never log passwords or sensitive data
   - Use placeholders for sensitive information

## Common Use Cases

### Debugging
```php
// Log variable for debugging
$debug = print_r($myVariable, true);
$log->save('debug', $debug);
```

### Error Tracking
```php
try {
    // Code that might fail
} catch (\Exception $e) {
    $log->error('exceptions', $e->getMessage());
}
```

### Audit Trail
```php
// Log user actions
$log->save('audit', 'User updated page', [
    'page_id' => $page->id,
    'page_title' => $page->title,
    'user' => $user->name
]);
```

## Configuration

### Log File Location
Logs are stored in: `/site/assets/logs/`

### Customizing Log Directory
You can change the log directory in your `config.php`:

```php
$config->paths->logs = $config->paths->site . 'my-custom-logs/';
```

### Log File Permissions
Default permissions are set to 0664. You can change this in `config.php`:

```php
$config->chmodFile = '0664';
```
