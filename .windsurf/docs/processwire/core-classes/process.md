# Process

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/process/)

## Overview

`Process` is the base class for admin pages and modules that handle user interaction in the ProcessWire administration panel.

## Usage

You create a `Process` module to add new functionality or custom pages to the ProcessWire admin.

```php
class ProcessMyModule extends Process {
    public function ___execute() {
        // Output HTML for your admin page
        return '<h1>My Custom Admin Page</h1>';
    }
}
```

## Common Methods

- `___execute()`: The main method executed when the process page is accessed.
- `is(['permission-name'])`: Checks if the current user has the required permission.
- `error($message)`: Displays an error message to the user.
- `message($message)`: Displays a success or informational message to the user.

## See Also
- [Module Class](https://processwire.com/api/ref/module/)
