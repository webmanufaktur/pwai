---
trigger: glob
globs: site/templates/**/*.php
---

# ProcessWire Lazy Cron

The LazyCron module provides hooks that are automatically executed at various intervals. It's called "lazy" because it's triggered by pageviews, ensuring the interval is at least the time requested (not exactly).

## Installation

```
// Go to Admin > Modules
// Click "check for new modules"
// Click "install" for the LazyCron module
```

## Available Time Intervals

- every30Seconds
- everyMinute
- every2Minutes
- every3Minutes
- every4Minutes
- every5Minutes
- every10Minutes
- every15Minutes
- every30Minutes
- every45Minutes
- everyHour
- every2Hours
- every4Hours
- every6Hours
- every12Hours
- everyDay
- every2Days
- every4Days
- everyWeek
- every2Weeks
- every4Weeks

## Usage Examples

### In a class/module:

```php
// initialize the hook in your AutoLoad module
public function init() {
    $this->addHook('LazyCron::every30Minutes', $this, 'myHook');
}

// the function you want executed every 30 minutes
public function myHook(HookEvent $e) {
    echo "30 Minutes have passed!";
}
```

### Procedural usage:

```php
// create your hook function 
function myHook(HookEvent $e) { 
    echo "30 Minutes have passed!"; 
} 

// add a hook to your function: 
wire()->addHook('LazyCron::every30Minutes', null, 'myHook');
```

### Getting elapsed time:

```php
function myHook(HookEvent $e) {
    $seconds = $e->arguments[0];
    echo "30 Minutes have passed! (actual seconds were: $seconds)";
}
```

## How It Works

- Hooks into ProcessWire's `ProcessPageView::finished()` method
- Executes after pageview delivery to avoid slowdowns
- Only executes during pageviews delivered by ProcessWire
- Not executed when using ProcessWire's API from other scripts

## Making It Not-Lazy

For exact timing, set up a real cron job to trigger a pageview:

```bash
wget --quiet --no-cache -O - http://www.your-site.com > /dev/null
```

This pulls a page from the site without output, ensuring the hooks execute at precise intervals.
