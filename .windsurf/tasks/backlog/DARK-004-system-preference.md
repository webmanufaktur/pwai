# [DARK-004] Add System Preference Detection
*Feature: Dark Mode Toggle | Status: Backlog*

## Description
Detect and respect the user's system color scheme preference.

## Technical Details
- [ ] Listen to `prefers-color-scheme` changes
- [ ] Set initial theme based on system preference
- [ ] Allow user to override system preference
- [ ] Update on system preference change

## Media Query Example
```javascript
const darkModeMediaQuery = window.matchMedia('(prefers-color-scheme: dark)');

// Check initial preference
if (darkModeMediaQuery.matches) {
  // Set dark theme
}

// Listen for changes
darkModeMediaQuery.addListener((e) => {
  // Update theme based on e.matches
});
```

## User Flow
1. First visit: Use system preference
2. User changes theme: Save preference
3. Next visits: Use saved preference

## Dependencies
- [DARK-001] Theme variables
- [DARK-003] Theme persistence

## Testing
- [ ] Detects system preference
- [ ] Updates on system change
- [ ] Respects user override
- [ ] Works in all supported browsers
