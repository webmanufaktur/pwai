# $datetime API Variable

The `$datetime` API variable provides date and time manipulation and formatting capabilities in ProcessWire.

## Overview

- **Type**: `WireDateTime`
- **Purpose**: Date and time manipulation and formatting
- **Availability**: Always available in templates and modules

## Basic Usage

### Getting Current Date/Time
```php
// Current timestamp
$now = time();

// Current date as string
$dateStr = date('Y-m-d H:i:s');

// Using WireDateTime
$now = $datetime->time();
$dateStr = $datetime->date('Y-m-d H:i:s');
```

### Formatting Dates
```php
// Format a timestamp
$formatted = $datetime->formatDate($timestamp, 'F j, Y');

// Format current time
$nowFormatted = $datetime->formatDate(time(), 'l, F j, Y g:i a');

// Localized date formatting
$localized = $datetime->formatDate($timestamp, 'full');
```

## Common Methods

### date($format = null, $value = null, $useUser = true)
Format a date string.

**Parameters:**
- `$format` (string): PHP date format or format name
- `$value` (int|string): Timestamp or date string
- `$useUser` (bool): Use user's date format settings

**Example:**
```php
echo $datetime->date('Y-m-d'); // 2023-05-04
echo $datetime->date('full');   // Thursday, May 4, 2023
```

### time()
Get current Unix timestamp.

**Example:**
```php
$timestamp = $datetime->time();
```

### strtotime($str, $now = null)
Parse about any English textual datetime description into a Unix timestamp.

**Example:**
```php
$nextWeek = $datetime->strtotime('+1 week');
$lastDay = $datetime->strtotime('last day of this month');
```

### relativeTimeStr($ts, $abbreviate = false, $useTense = true)
Get a relative time string (e.g., "2 hours ago").

**Example:**
```php
echo $datetime->relativeTimeStr(strtotime('-3 days'));
// Outputs: 3 days ago
```

## Date/Time Manipulation

### Adding/Subtracting Time
```php
// Add 1 day
$tomorrow = $datetime->strtotime('+1 day');

// Subtract 2 weeks
$twoWeeksAgo = $datetime->strtotime('-2 weeks');

// First day of next month
$firstDayNextMonth = $datetime->strtotime('first day of next month');
```

### Date Comparison
```php
// Compare two dates
$date1 = strtotime('2023-01-15');
$date2 = time();

if($date1 < $date2) {
    // Date 1 is in the past
}

// Get difference in days
$diff = ($date2 - $date1) / (60 * 60 * 24);
```

## Timezone Handling

### Setting Timezone
```php
// Set default timezone
$datetime->setTimeZone('America/New_York');

// Get current timezone
$timezone = $datetime->getTimeZone()->getName();
```

### Converting Timezones
```php
// Convert between timezones
$date = new DateTime('now', new DateTimeZone('UTC'));
$date->setTimezone(new DateTimeZone('America/New_York'));
echo $date->format('Y-m-d H:i:s');
```

## Localization

### Setting Locale
```php
// Set locale for date formatting
setlocale(LC_TIME, 'de_DE.UTF-8');

// Get localized month names
$monthName = strftime('%B', $timestamp);
```

### Localized Date Formats
```php
// Get localized date format
$format = $datetime->getDateFormat('medium');

// Common format types:
// full, long, medium, short, relative
```

## Common Use Cases

### Age Calculation
```php
function calculateAge($birthdate) {
    $birth = new DateTime($birthdate);
    $now = new DateTime();
    $interval = $now->diff($birth);
    return $interval->y; // Returns age in years
}
```

### Countdown Timer
```php
function timeUntil($futureDate) {
    $now = time();
    $future = strtotime($futureDate);
    $diff = $future - $now;
    
    if($diff < 0) return 'Event has passed';
    
    $days = floor($diff / (60 * 60 * 24));
    $hours = floor(($diff % (60 * 60 * 24)) / (60 * 60));
    
    return "$days days, $hours hours remaining";
}
```

### Business Days Calculation
```php
function getBusinessDays($startDate, $endDate) {
    $start = new DateTime($startDate);
    $end = new DateTime($endDate);
    $businessDays = 0;
    
    while($start <= $end) {
        $dayOfWeek = $start->format('N');
        if($dayOfWeek < 6) { // 6 and 7 are weekend
            $businessDays++;
        }
        $start->modify('+1 day');
    }
    
    return $businessDays;
}
```

## Best Practices

1. **Always Use Timezones**
   - Set a default timezone in your config.php
   - Be consistent with timezone usage

2. **Use Relative Formats**
   - Use relative formats for better readability
   - Example: `+1 day` instead of calculating timestamps

3. **Cache Expensive Operations**
   - Cache formatted dates in loops
   - Consider timezone conversions when caching

4. **Input Validation**
   - Always validate date inputs
   - Use `strtotime()` with validation

## Configuration

### Date/Time Settings in config.php
```php
// Default timezone
date_default_timezone_set('America/New_York');

// Custom date formats
$config->dateFormat = 'm/d/Y';
$config->timeFormat = 'g:i a';

// First day of week (0=Sunday, 1=Monday)
$config->dateFirstDayOfWeek = 1;
```

### Localization Settings
```php
// Set locale for dates
setlocale(LC_TIME, 'en_US.UTF-8');

// Enable UTF-8 for multibyte characters
mb_internal_encoding('UTF-8');
```
