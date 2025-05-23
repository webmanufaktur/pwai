# [DARK-002] Create Theme Toggle Component
*Feature: Dark Mode Toggle | Status: Backlog*

## Description
Create a reusable theme toggle button component.

## Technical Details
- [ ] Create `ThemeToggle.svelte` component
- [ ] Add sun/moon icons
- [ ] Toggle between light/dark modes
- [ ] Add smooth transitions

## Component Props
```typescript
export let initialTheme: 'light' | 'dark' = 'light';
```

## Events
- `themeChange`: Emits when theme changes

## Styling
- Match app design system
- Accessible button
- Smooth icon transitions

## Dependencies
- [DARK-001] Theme variables

## Testing
- [ ] Toggle works correctly
- [ ] Icons update
- [ ] Keyboard accessible
- [ ] Screen reader friendly
