# Contributing to ProcessWire AI Starter

Thank you for your interest in contributing! We welcome all forms of contributions, including bug reports, bug fixes, documentation improvements, and feature requests.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Code Style](#code-style)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Feature Requests](#feature-requests)
- [License](#license)

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally
   ```bash
   git clone https://github.com/your-username/processwire-ai-starter.git
   cd processwire-ai-starter
   ```
3. Install dependencies
   ```bash
   # PHP dependencies
   composer install
   
   # Node.js dependencies
   nvm use  # If using nvm
   npm install
   ```
4. Create a branch for your changes
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b bugfix/description-of-fix
   ```

## Development Workflow

1. Start the development server
   ```bash
   npm run dev
   ```
2. Make your changes
3. Test your changes
4. Format your code
   ```bash
   npm run format
   ```
5. Commit your changes following the [commit message guidelines](#commit-message-guidelines)
6. Push your changes to your fork
   ```bash
   git push origin your-branch-name
   ```
7. Open a pull request

## Code Style

- Follow [PSR-12](https://www.php-fig.org/psr/psr-12/) for PHP code
- Use [Prettier](https://prettier.io/) for JavaScript, CSS, and other frontend code
- Document your code with PHPDoc for PHP and JSDoc for JavaScript
- Keep lines under 120 characters when possible
- Use meaningful variable and function names

## Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for our commit messages. This allows us to automatically generate changelogs and determine version bumps.

### Commit Message Format

Each commit message consists of a **header**, a **body**, and a **footer**. The header has a special format that includes a **type**, a **scope**, and a **subject**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

### Type

Must be one of the following:

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools and libraries

### Scope

The scope could be anything specifying the place of the commit change. For example:
- `api`
- `ui`
- `build`
- `deps`
- `config`

### Subject

The subject contains a succinct description of the change:

- use the imperative, present tense: "change" not "changed" nor "changes"
- don't capitalize the first letter
- no dot (.) at the end

### Body

Just as in the **subject**, use the imperative, present tense: "change" not "changed" nor "changes". The body should include the motivation for the change and contrast this with previous behavior.

### Footer

The footer should contain any information about **Breaking Changes** and is also the place to reference GitHub issues that this commit **Closes**.

**Breaking Changes** should start with the word `BREAKING CHANGE:` with a space or two newlines. The rest of the commit message is then used for this.

### Examples

```
feat(api): add user authentication

description of the change

Closes #123
```

```
fix(ui): resolve alignment issue in header

- Fixed alignment of navigation items
- Adjusted padding for better mobile view

Fixes #456
```

```
chore(deps): update dependencies

- Update Tailwind CSS to v4.1.8
- Update Alpine.js to v3.14.9
```

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations, and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent. The versioning scheme we use is [SemVer](http://semver.org/).
4. You may merge the Pull Request once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you.

## Reporting Bugs

Before creating bug reports, please check if the issue has already been reported by searching the [issue tracker](https://github.com/username/repository/issues). If you're unable to find an open issue addressing the problem, open a new one.

### Bug Report Guidelines

- **Use a clear and descriptive title** for the issue to identify the problem.
- **Describe the exact steps which reproduce the problem** in as many details as possible.
- **Provide specific examples** to demonstrate the steps. Include links to files or GitHub projects, or copy/pasteable snippets.
- **Describe the behavior you observed** after following the steps and point out what exactly is the problem with that behavior.
- **Explain which behavior you expected to see** instead and why.
- **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem.

## Feature Requests

We welcome feature requests. Before submitting one, please check if a similar feature has already been requested by searching the [issue tracker](https://github.com/username/repository/issues).

### Feature Request Guidelines

- **Use a clear and descriptive title** for the issue to identify the suggestion.
- **Provide a step-by-step description** of the suggested enhancement in as many details as possible.
- **Provide specific examples** to demonstrate the steps. Include copy/pasteable snippets which you use in those examples.
- **Describe the current behavior** and **explain which behavior you expected to see** instead and why.
- **Explain why this enhancement would be useful** to most users.
- **List some other applications where this enhancement exists, if any.**

## License

By contributing, you agree that your contributions will be licensed under its MIT License.
