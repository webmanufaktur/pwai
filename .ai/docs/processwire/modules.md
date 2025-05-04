# Modules

ProcessWire modules extend the core functionality. This document covers module development and usage.

## Module Types

### Process Modules
Admin interface modules that appear in the ProcessWire admin.

### Fieldtype Modules
Define new field types for content storage.

### Inputfield Modules
Define form input fields for the admin interface.

### Textformatter Modules
Format text content when it's output.

### System Modules
Core system functionality.

## Creating a Module

### Basic Structure
```php
<?php namespace ProcessWire;

class MyModule extends WireData implements Module {
    
    public static function getModuleInfo() {
        return [
            'title' => 'My Module',
            'version' => '1.0.0',
            'summary' => 'My awesome module',
            'autoload' => true,
            'singular' => true,
        ];
    }
    
    public function init() {
        // Initialize module
        $this->addHook('Page::render', $this, 'beforeRender');
    }
    
    public function beforeRender($event) {
        $page = $event->object;
        // Module logic here
    }
}
```

### Module Configuration

#### config.php
```php
<?php

return [
    'apiKey' => '',
    'enabled' => true,
    'settings' => [
        'option1' => 'default',
        'option2' => 100
    ]
];
```

#### Module Class with Config
```php
public function __construct() {
    $this->config = $this->wire('modules')->getModuleConfigData($this);
}

public function getModuleConfigInputfields() {
    $inputfields = $this->wire('modules')->get('InputfieldFieldset');
    
    $f = $this->wire('modules')->get('InputfieldText');
    $f->name = 'apiKey';
    $f->label = 'API Key';
    $f->value = $this->config['apiKey'];
    $inputfields->add($f);
    
    return $inputfields;
}
```

## Common Module Patterns

### Hooks
```php
public function init() {
    // Before a page is saved
    $this->addHookBefore('Pages::saveReady', $this, 'beforePageSave');
    
    // After a page is saved
    $this->addHookAfter('Pages::saved', $this, 'afterPageSave');
    
    // Custom method hook
    $this->addHook('Page::customMethod', $this, 'hookCustomMethod');
}

public function beforePageSave($event) {
    $page = $event->arguments[0];
    // Your code here
}

public function hookCustomMethod($event) {
    $page = $event->object;
    $result = "Modified: " . $event->return;
    $event->return = $result;
}
```

### Adding API Methods
```php
public function myApiMethod($param1, $param2) {
    // Your code here
    return $result;
}

// Usage: $modules->get('MyModule')->myApiMethod('a', 'b');
```

### Adding Admin Pages
```php
public function init() {
    // Add navigation item
    $this->wire('config')->scripts->add($this->config->urls->MyModule . 'mymodule.js');
    $this->wire('config')->styles->add($this->config->urls->MyModule . 'mymodule.css');
}

public function ___execute() {
    $out = "<h2>My Module</h2>";
    // Your admin interface code
    return $out;
}
```

## Module Installation

### Programmatic Installation
```php
// Install module
$module = $modules->get('ModuleName');
if(!$module->isInstalled()) {
    $modules->install('ModuleName');
}

// Uninstall module
if($module->isInstalled()) {
    $modules->uninstall('ModuleName');
}
```

## Best Practices

1. **Namespace Your Code**
   ```php
   namespace ProcessWire;
   ```

2. **Use Hooks Wisely**
   - Prefer explicit hooks over broad hooks
   - Use `before` and `after` hooks appropriately

3. **Error Handling**
   ```php
   try {
       // Your code
   } catch(\Exception $e) {
       $this->error($e->getMessage());
   }
   ```

4. **Caching**
   ```php
   $cache = $this->wire('cache');
   $key = 'my_module_data';
   
   $data = $cache->get($key);
   if(!$data) {
       $data = $this->getExpensiveData();
       $cache->save($key, $data, 3600);
   }
   ```

5. **Logging**
   ```php
   $this->log('Something happened');
   $this->warning('Warning message');
   $this->error('Error message');
   ```

## Module Configuration

### config.php
```php
return [
    'apiEndpoint' => 'https://api.example.com',
    'maxItems' => 10,
    'enabled' => true,
    'settings' => [
        'option1' => 'default',
        'option2' => 100
    ]
];
```

### Using Configuration
```php
$config = $this->wire('modules')->getModuleConfigData($this);
$endpoint = $config['apiEndpoint'];
```

## Module Assets

### Adding CSS/JS
```php
public function init() {
    $this->wire('config')->scripts->add($this->config->urls->MyModule . 'js/mymodule.js');
    $this->wire('config')->styles->add($this->wire('config')->urls->MyModule . 'css/mymodule.css');
}
```

### Template Files
```php
public function renderAdmin() {
    $view = new TemplateFile($this->config->paths->MyModule . 'views/admin.php');
    $view->set('config', $this->config);
    return $view->render();
}
```
