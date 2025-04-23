# ProcessWire Module Development Guide

## Basic Module Structure

Create a PHP class that extends a ProcessWire core class and implements the Module interface:

```php
 'My Module',
        'summary' => 'Description of my module',
        'version' => 1,
        'autoload' => true, // Optional: load automatically
    ];
}
```

## Creating Module Methods

Add custom methods to your module:

```php
public function myMethod() {
    return "Hello " . $this->user->name;
}
```

## Using Your Module

Call your module from template files:

```php
$module = $modules->get('MyModule');
echo $module->myMethod();
```

## Autoload Modules

Make your module load automatically by setting `'autoload' => true` in `getModuleInfo()`.

Add a `ready()` method that runs when ProcessWire boots:

```php
public function ready() {
    if($this->page->template == 'admin') {
        $this->message("Hello admin user");
    }
}
```

Conditional autoloading: `'autoload' => 'template=admin'`

## Adding Hooks

Hook into ProcessWire methods:

```php
public function ready() {
    // Hook after Page::render
    $this->addHookAfter('Page::render', $this, 'myHookMethod');
}

public function myHookMethod($event) {
    $event->return .= 'Additional content';
}
```

Using anonymous functions:

```php
public function ready() {
    $this->addHookAfter('Page::render', function($event) {
        $event->return .= 'Additional content';
    });
}
```

## Adding New Methods to Existing Classes

```php
public function ready() {
    $this->addHook('Page::summarize', $this, 'summarize');
}

public function summarize($event) {
    $page = $event->object;
    $maxlen = $event->arguments(0) ?: 200;
    $summary = $this->sanitizer->truncate($page->body, $maxlen);
    $event->return = $summary;
}
```

## Hooking Specific Instances

```php
public function ready() {
    // Hook specific instance
    $this->pages->addHookAfter('saved', function($event) {
        $page = $event->arguments(0);
        $this->message("You just saved page: $page->url");
    });
}
```

## Module Naming Requirements

- First character: uppercase letter (A-Z)
- Second character: lowercase letter (a-z)
- Remaining characters: letters and optionally numbers
- Good examples: `HelloWorld`, `Helloworld`
- Bad examples: `HELLOworld`, `helloWorld`
- Filename must match class name with `.module.php` extension
- Module gets saved to subfolder with matching class name to `site/modules/` 