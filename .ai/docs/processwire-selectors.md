# ProcessWire Selectors

Selectors are text strings that specify fields and values to find pages and other data in ProcessWire. They're based on jQuery's attribute selector syntax.

## Basic Structure

A selector consists of three parts:

- **Field**: The property to match against
- **Operator**: How to compare (e.g., =, >, find("selector");
  $pages->get("selector, path or ID");
  $page->children("selector");
  $page->siblings("selector");
  $page->find("selector");

````

## Operators

### Basic Operators
```php
=    // Equal to
!=   // Not equal to
    // Greater than
=   // Greater than or equal to
````

### Text Search Operators

```php
*=   // Contains phrase/text
~=   // Contains all words (any order)
%=   // Contains phrase/text using LIKE
^=   // Starts with phrase/text
$=   // Ends with phrase/text
```

### Advanced Text Operators

```php
~*=  // Contains all partial words
~~=  // Contains all words live
~|=  // Contains any words
#=   // Advanced text search
```

### Negative Operators

```php
!body*=phrase  // Pages NOT containing phrase
```

## Multiple Selectors

Combine selectors with commas:

```php
year=2010, body*=Hanna
```

## OR Conditions

### OR Values

```php
firstname=Mike|Steve
id=123|124|125
```

### OR Fields

```php
body|sidebar*=carbonated
```

### OR Groups

```php
$items = $pages->find("template=product, stock>0, (featured_from=today), (highlighted=1)");
```

## Sub-selectors

Use square brackets for nested conditions:

```php
$items = $pages->find("template=product, company=[locations>5, locations.title%=Finland]");
```

## Sorting

```php
sort=title        // Sort A-Z
sort=-title       // Sort Z-A
sort=-date, sort=title  // Multiple sort criteria
```

## Limiting Results

```php
limit=50          // Return max 50 results
start=50, limit=50  // Return results 51-100
```

## Count Selectors

Match by quantity:

```php
children.count>0, images.count>=3
```

## Subfield Selectors

Match properties of complex fields:

```php
images.description*=atrium
buildings.feet_high>1000
```

## Template and Parent Selectors

```php
template=name1|name2|name3
parent=/path/to/parent/
parent=$parent
parent=123
has_parent=/path/to/ancestor/
```

## Access Control

```php
include=hidden       // Include hidden pages
include=unpublished  // Include hidden and unpublished
include=all          // No exclusions
check_access=0       // Ignore access control
```

## Sanitizing User Input

```php
$year = (int) $input->post->year;
$matches = $pages->find("year=$year");

$keywords = $sanitizer->selectorValue($input->get->keywords);
$matches = $pages->find("keywords~=$keywords");
```