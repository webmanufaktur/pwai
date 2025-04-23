# Tailwind CSS 4 rules

## Core Changes

- Use CSS-first configuration with `@theme` directive instead of JavaScript config `tailwind.config.js`:

```css
@import "tailwindcss";

@theme {
  --font-display: "Satoshi", "sans-serif";
  --breakpoint-3xl: 1920px;
  --color-avocado-500: oklch(0.84 0.18 117.33);
  --ease-fluid: cubic-bezier(0.3, 0, 0, 1);
}
```

- Import legacy config files with the `@config` directive:

```css
@import "tailwindcss";
@config "../../tailwind.config.js";
```

- Use `@import "tailwindcss"` instead of separate `@tailwind` directives:

```css
/* Old way */
@tailwind base;
@tailwind components;
@tailwind utilities;

/* New way */
@import "tailwindcss";
```

- Use updated package names:
  - PostCSS plugin: `@tailwindcss/postcss` (not `tailwindcss`)
  - CLI: `@tailwindcss/cli`
  - Vite plugin: `@tailwindcss/vite`

## Theme Configuration

- Use CSS variables for all design tokens:

```css
/* In CSS */
.custom-element {
  background-color: var(--color-blue-500);
  font-family: var(--font-sans);
}
```

- Available CSS variable namespaces:
  - `--color-*`: Colors (e.g., `--color-blue-500`)
  - `--font-*`: Font families (e.g., `--font-sans`)
  - `--text-*`: Font sizes (e.g., `--text-xl`)
  - `--font-weight-*`: Font weights (e.g., `--font-weight-bold`)
  - `--spacing-*`: Spacing values (e.g., `--spacing-4`)
  - `--radius-*`: Border radius (e.g., `--radius-md`)
  - `--shadow-*`: Box shadows (e.g., `--shadow-lg`)

- Override entire namespaces or the whole theme:

```css
@theme {
  /* Override all font variables */
  --font-*: initial;
  
  /* Override the entire theme */
  --*: initial;
}
```