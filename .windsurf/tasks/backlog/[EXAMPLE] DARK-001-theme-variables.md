# [EXAMPLE] [DARK-001] Set up Theme Variables
*Feature: Dark Mode Toggle | Status: Example*
*This is an example task file. Duplicate and modify as needed.*

## Description
Set up CSS variables for light and dark themes.

## Technical Details
- [ ] Define color variables in `:root`
- [ ] Create theme classes (`.light`, `.dark`)
- [ ] Set up base typography colors
- [ ] Add component-specific variables

## CSS Variables Example
```css
:root {
  /* Light theme (default) */
  --bg-primary: #ffffff;
  --text-primary: #1a1a1a;
  /* Add more variables */
}

.dark {
  --bg-primary: #1a1a1a;
  --text-primary: #ffffff;
  /* Override for dark theme */
}
```

## Testing
- [ ] Verify colors in both themes
- [ ] Check contrast ratios
- [ ] Test in different components

## Dependencies
- None

## Notes
- Use HSL for better theming control
- Document color usage in design system
