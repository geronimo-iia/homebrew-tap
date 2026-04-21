# Changelog

All notable changes to this tap will be documented in this file.

## [0.5.1] - 2026-03-10

### Changed

- Updated formula to agentctl v0.5.1 — adds `--force` flag to `hub refresh` command for cache bypass

## [0.5.0] - 2026-01-16

### Changed

- Updated formula to agentctl v0.5.0 — adds `skill export` command for backup and sharing

## [0.4.1] - 2026-07-16

### Changed

- Updated formula to agentctl v0.4.1 — adds enhanced ignore patterns for hub validation and generation

## [0.4.0] - 2026-07-16

### Changed

- Updated formula to agentctl v0.4.0 — adds `config init/show/path/get/set` subcommands and skill install fixes

## [0.2.0] - 2026-07-15

### Changed

- Switch to pre-built binaries from GitHub Releases — no longer requires Rust to install
- Install time reduced from ~5 minutes (compile) to seconds (binary download)

## [0.1.0] - 2026-07-14

### Added

- Initial formula for `agentctl` — builds from source via `cargo install`
