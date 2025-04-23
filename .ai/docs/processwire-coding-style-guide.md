# ProcessWire PHP Coding Style Guide

## General Syntax

- Use only `` tag from PHP-only files

```php
 $value) {
    // foreach body
}
```

## Operators

- Comparison, arithmetic, string operators: space before and after
- Logical operators: space before, no space after
- Increment/decrement: no space between operator and value

```php
$a == $b;
$a + $b;
$a && !$b;
$a++;
```

## Strings and Quotes

- Use double quotes if string contains variables
- Use quotes that minimize character escaping

```php
echo "Welcome $firstName $lastName!";
echo "";
```

## Multi-language Strings

```php
echo $this->_('Translatable phrase');
echo __('Translatable phrase');
echo sprintf(__('Thank you for visiting %s'), $user->fullname);
```

## API Variables

```php
// Within Wire-derived classes
$page = $this->wire('page');
$pages = $this->pages;

// Outside Wire-derived classes
$page = wire('page');
```

## ProcessWire 3.x Namespace

```php
wire(new SampleClass());
```

## PHPDoc Style

```php
/**
 * Description of method
 *
 * @param int $arg1
 * @param int $arg2
 */
public function someMethod($arg1, $arg2) {
    // method body
}
```
