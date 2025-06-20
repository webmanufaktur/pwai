> [!WARNING]  
> **This project is currently in BETA.**
> Features and APIs are subject to frequent changes and may not be stable. Please use with caution and expect regular updates.

# ProcessWire AI Starter

A modern ProcessWire CMS/CMF starter project with Tailwind CSS, Alpine.js, and Twig template engine.


## 🚀 Features

- **Modern Frontend**
  - Tailwind CSS v4 for utility-first styling
  - Alpine.js for reactive components
  - HTMX for dynamic content loading
  - Twig templating engine

- **Development Experience**
  - Pre-configured for VS Code and Cursor
  - Built-in code snippets
  - Comprehensive documentation
  - Development and production build processes

- **ProcessWire CMS/CMF**
  - RockMigrations for database migrations
  - Custom modules and hooks
  - Page classes and custom fields

## 🛠️ Tech Stack

- **Backend**
  - PHP 8.2+
  - ProcessWire CMS/CMF
  - RockMigrations

- **Frontend**
  - Tailwind CSS v4
  - Alpine.js
  - HTMX
  - Twig Template Engine

## 📁 Project Structure

```
.
├── .cursor/                      # Cursor IDE configuration
├── .windsurf/                    # Windsurf IDE configuration
├── .docs/                        # Project documentation
│   ├── processwire/              # ProcessWire-specific docs
│   └── rockmigrations/           # RockMigrations docs
├── .snippets/                    # Code snippets for IDEs
│   └── rockmigrations/           # RockMigrations snippets
├── .vscode/                      # VS Code configuration
├── site/                         # ProcessWire site files
│   ├── assets/                   # Static files (fonts, images)
│   ├── classes/                  # ProcessWire Page Classes
│   ├── hooks/                    # ProcessWire Hooks
│   ├── modules/                  # ProcessWire Modules
│   ├── ready.php                 # Single use hooks
│   ├── migrate.php               # Migrations file
│   └── templates/                # Template files
│       ├── dist/                 # Compiled assets
│       ├── src/                  # Source files
│       └── views/                # Twig files
│           ├── components/       # Twig components
│           │   └── forms/        # Twig form components
│           └── layouts/          # Twig layouts
├── .editorconfig                 # Editor configuration
├── .gitignore                    # Git ignore rules
├── .nvmrc                        # Node.js version
├── .prettierrc                   # Prettier configuration
├── composer.json                 # PHP dependencies
├── package.json                  # Node.js scripts and dependencies
└── README.md                     # This file
```

## 🚀 Getting Started

### Prerequisites

- PHP 8.2 or higher
- Node.js 18+ (specified in .nvmrc)
- Composer
- MySQL/MariaDB

### Installation

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd project-name
   ```

2. **Install PHP dependencies**
   ```bash
   composer install
   ```

3. **Install Node.js dependencies**
   ```bash
   nvm use  # If using nvm
   npm install
   ```

4. **Start the development server**
   ```bash
   npm run dev
   ```

5. **Build for production**
   ```bash
   npm run build
   ```

## 🛠 Development

### Available Scripts

#### Main Scripts
- `npm run dev` - Start development server with watch mode for all assets (runs all dev:* scripts in parallel)
- `npm run build` - Clean dist folder and build all assets for production

#### Development Scripts (Watch Mode)
- `npm run dev:tailwindcss` - Watch and compile Tailwind CSS with sourcemaps
- `npm run dev:alpinejs` - Watch and bundle Alpine.js with sourcemaps
- `npm run dev:htmx` - Watch and bundle HTMX with sourcemaps

#### Production Build Scripts
- `npm run build:tailwindcss` - Build and minify Tailwind CSS
- `npm run build:alpinejs` - Build and minify Alpine.js bundle
- `npm run build:htmx` - Build and minify HTMX bundle
- `npm run build:twig` - Format Twig templates with Prettier
- `npm run build:css` - Format CSS files with Prettier

## 📚 Documentation

- [ProcessWire Documentation](https://processwire.com/docs/)
- [RockMigrations](https://github.com/baumrock/RockMigrations)
- [Tailwind CSS](https://tailwindcss.com/)
- [Alpine.js](https://alpinejs.dev/)
- [HTMX](https://htmx.org/)
- [Twig](https://twig.symfony.com/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of notable changes.

## 📧 Contact

[Your Name] - [Your Email]

Project Link: [https://github.com/username/repository](https://github.com/username/repository)

ProcessWire
█░░░░░░░░░░░░░░░░░░░ 5%


Features
█░░░░░░░░░░░░░░░░░░░ 5%
```

## Github

- https://github.com/webmanufaktur/pwai/

### Issues

- https://github.com/webmanufaktur/pwai/issues
