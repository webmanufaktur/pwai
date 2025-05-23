# [DARK-003] Add Theme Persistence
*Feature: Dark Mode Toggle | Status: Backlog*

## Description
Save and load user theme preference using localStorage.

## Technical Details
- [ ] Create theme store
- [ ] Save preference to localStorage
- [ ] Load preference on app start
- [ ] Handle localStorage errors

## Store Interface
```typescript
interface ThemeStore {
  theme: 'light' | 'dark';
  setTheme: (theme: 'light' | 'dark') => void;
  toggleTheme: () => void;
}
```

## Error Handling
- Handle localStorage quota exceeded
- Handle localStorage disabled
- Fallback to system preference

## Dependencies
- [DARK-001] Theme variables
- [DARK-002] Theme toggle component

## Testing
- [ ] Preference persists across page reloads
- [ ] Handles missing localStorage
- [ ] Falls back gracefully
