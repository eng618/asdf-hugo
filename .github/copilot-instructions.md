# AI Coding Agent Instructions for asdf-hugo

## Project Overview
This is an [asdf](https://asdf-vm.com) plugin for installing [Hugo](https://gohugo.io), the static site generator. It supports both regular and extended Hugo versions (extended versions include Sass/SCSS support).

## Architecture
- **bin/**: Core asdf plugin scripts (`download`, `install`, `list-all`)
- **lib/utils.bash**: Shared utilities and core logic
- **scripts/**: Linting and formatting scripts (`lint.sh`, `shellcheck.bash`, `shfmt.bash`)

All scripts source `lib/utils.bash` for common functions like `fail()`, `get_platform()`, `download_release()`.

## Key Patterns
- **Strict Bash**: All scripts use `set -euo pipefail` for error handling
- **Error Handling**: Use `fail()` function for consistent error messages (e.g., `fail "Could not download $url"`)
- **Version Handling**: Extended versions prefixed with `extended_` (e.g., `extended_0.111.3`)
- **Platform Detection**: `get_platform()` and `get_arch()` map system info to Hugo release names
- **Download Logic**: `download_release()` constructs GitHub release URLs based on version, platform, arch
- **macOS Special Case**: Uses `.pkg` files for newer versions, extracts with `pkgutil` and `cpio`

## Development Workflow
- **Lint**: Run `./scripts/lint.sh` for code quality checks, or `./scripts/lint.sh --fix` to auto-fix formatting issues
- **Test Locally**: `asdf plugin test hugo <repo-url> "hugo version"`
- **CI**: Lints on push/PR, tests plugin installation on Ubuntu/macOS
- **Release**: Automated via release-please on main branch pushes

## Conventions
- Indent with 2 spaces (per `.editorconfig`)
- Functions defined in `lib/utils.bash` for reuse
- GitHub API token support via `GITHUB_API_TOKEN` env var
- Version sorting uses custom `sort_versions()` for semantic versioning

## Examples
- Adding new platform support: Update `get_platform()` case statement and `download_release()` URL construction
- Modifying download: Edit `download_release()` in `lib/utils.bash` to handle new asset patterns
- Testing changes: Use `asdf plugin test` with local repo path</content>
<parameter name="filePath">/home/eng618/Development/asdf-hugo/.github/copilot-instructions.md
