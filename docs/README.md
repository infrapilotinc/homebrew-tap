# homebrew-tap — Documentation

Homebrew tap for the InfraPilot CLI. This repo holds a single formula,
[`Formula/infrapilot.rb`](../Formula/infrapilot.rb), which installs the
`@infrapilot/cli` npm package.

This repository is **public** — Homebrew must be able to clone it for
`brew tap` to work.

## Install

```bash
brew tap infrapilothq/tap
brew install infrapilot
infrapilot --version
```

## Index

- [CI/CD & formula updates](CI-CD.md) — how the formula is linted and bumped

## How it fits together

The CLI is built and published to npm from
[`infrapilot.org`](https://github.com/infrapilothq/infrapilot.org)
(`apps/cli` → `@infrapilot/cli`). The formula points at the published npm
tarball:

```
infrapilot.org  ──pnpm publish──►  npm: @infrapilot/cli@X.Y.Z
                                          │
                                          ▼
                       homebrew-tap formula: url + sha256 bumped
                                          │
                                          ▼
                          brew install infrapilothq/tap/infrapilot
```

## Repository map

| Repo | Visibility | Purpose |
|------|-----------|---------|
| [`InfraPilot`](https://github.com/infrapilothq/InfraPilot) | public | Community Edition control plane |
| [`infrapilot-ee`](https://github.com/infrapilothq/infrapilot-ee) | private | Enterprise Edition |
| [`infrapilot.org`](https://github.com/infrapilothq/infrapilot.org) | private | Site, license, account portal, CLI source |
| [`homebrew-tap`](https://github.com/infrapilothq/homebrew-tap) (this repo) | public | Homebrew formula |

Aggregated in the `infrapilot-platform` meta-repo (git submodules).
