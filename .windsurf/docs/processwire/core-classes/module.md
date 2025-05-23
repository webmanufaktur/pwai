# Module Class

The Module interface is implemented by all ProcessWire modules and defines the basic requirements for a module.

## Overview

Modules are the primary way to extend ProcessWire's functionality. They can add new features, modify existing behavior, or provide new services to the system. The Module interface defines the basic requirements that all modules must implement.

## Module Types

ProcessWire has several types of modules:

1. **Core Modules** - Built-in modules that come with ProcessWire
2. **Site Modules** - Custom modules specific to a site
3. **Third-Party Modules** - Modules created by the community

Modules can also be categorized by their functionality:

1. **Fieldtype** - Defines a new field type
2. **Inputfield** - Provides a form input for editing fields
3. **Process** - Provides admin functionality
4. **Textformatter** - Formats text
5. **Markup** - Generates HTML markup
6. **Wire** - General purpose modules

## Required Methods

All modules must implement the following methods:

- `Module::getModuleInfo()` - Returns information about the module
- `Module::__construct()` - Constructor for the module

## Module Information

The `getModuleInfo()` method returns an array with information about the module. This information is used by ProcessWire to determine how to load and use the module. The array can include the following keys:

- `title` - The human-readable title of the module
- `version` - The version number of the module
- `summary` - A brief summary of what the module does
- `href` - A URL to the module's documentation or homepage
- `requires` - An array of modules that this module requires
- `installs` - An array of modules that this module installs
- `permission` - The permission required to use this module
- `permissions` - An array of permissions this module adds
- `icon` - An icon for the module
- `singular` - Whether the module should be a singleton
- `autoload` - Whether the module should be loaded automatically
- `namespace` - The PHP namespace for the module
- `permanent` - Whether the module can be uninstalled
- `configurable` - Whether the module has configuration options

## Module Configuration

Modules can be configurable, which means they can have settings that can be changed in the admin. To make a module configurable, set the `configurable` key in the module info to `true` and implement the following methods:

- `Module::getModuleConfigInputfields(array $data)` - Returns Inputfields for configuring the module
- `Module::setConfigData(array $data)` - Sets the configuration data for the module
- `Module::getConfigData()` - Gets the configuration data for the module

## Module Initialization

Modules can implement the following methods to hook into the initialization process:

- `Module::init()` - Called when the module is loaded
- `Module::ready()` - Called when all modules are loaded and ready
- `Module::install()` - Called when the module is installed
- `Module::uninstall()` - Called when the module is uninstalled

## Usage Examples

### Basic Module

```php
class HelloWorld extends WireData implements Module {

    public static function getModuleInfo() {
        return [
            'title' => 'Hello World',
            'version' => 100,
            'summary' => 'A simple example module',
            'singular' => true,
            'autoload' => true,
        ];
    }

    public function init() {
        // Add a hook to modify the page render
        $this->addHook('Page::render', $this, 'addHelloWorld');
    }

    public function addHelloWorld(HookEvent $event) {
        $page = $event->object;
        $content = $event->return;
        $event->return = "<h1>Hello World!</h1>" . $content;
    }
}
```

### Configurable Module

```php
class HelloWorld extends WireData implements Module, ConfigurableModule {

    protected static $defaults = [
        'message' => 'Hello World!',
        'enabled' => true
    ];

    public static function getModuleInfo() {
        return [
            'title' => 'Hello World',
            'version' => 100,
            'summary' => 'A simple example module',
            'singular' => true,
            'autoload' => true,
            'configurable' => true
        ];
    }

    public function init() {
        // Add a hook to modify the page render
        if($this->enabled) {
            $this->addHook('Page::render', $this, 'addMessage');
        }
    }

    public function addMessage(HookEvent $event) {
        $page = $event->object;
        $content = $event->return;
        $event->return = "<h1>{$this->message}</h1>" . $content;
    }

    public static function getModuleConfigInputfields(array $data) {
        $data = array_merge(self::$defaults, $data);
        $fields = new InputfieldWrapper();
        
        $field = wire('modules')->get('InputfieldText');
        $field->name = 'message';
        $field->label = 'Message';
        $field->value = $data['message'];
        $fields->add($field);
        
        $field = wire('modules')->get('InputfieldCheckbox');
        $field->name = 'enabled';
        $field->label = 'Enabled';
        $field->checked = $data['enabled'];
        $fields->add($field);
        
        return $fields;
    }
}
```

### Module with Installation

```php
class HelloWorld extends WireData implements Module {

    public static function getModuleInfo() {
        return [
            'title' => 'Hello World',
            'version' => 100,
            'summary' => 'A simple example module',
            'singular' => true,
            'autoload' => true,
        ];
    }

    public function init() {
        // Add a hook to modify the page render
        $this->addHook('Page::render', $this, 'addHelloWorld');
    }

    public function addHelloWorld(HookEvent $event) {
        $page = $event->object;
        $content = $event->return;
        $event->return = "<h1>Hello World!</h1>" . $content;
    }

    public function install() {
        // Create a new page for the module
        $page = new Page();
        $page->template = 'basic-page';
        $page->parent = wire('pages')->get('/');
        $page->name = 'hello-world';
        $page->title = 'Hello World';
        $page->save();
    }

    public function uninstall() {
        // Remove the page created by the module
        $page = wire('pages')->get('/hello-world/');
        if($page->id) {
            $page->delete();
        }
    }
}
```

## Additional Information

Modules are a powerful way to extend ProcessWire's functionality. They can be used to add new features, modify existing behavior, or provide new services to the system.

For more information, see the [official ProcessWire documentation](https://processwire.com/api/ref/module/).
