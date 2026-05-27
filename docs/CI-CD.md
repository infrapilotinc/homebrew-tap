# CI/CD

GitHub Actions workflows live in [`.github/workflows/`](../.github/workflows).

## Workflows

| Workflow | File | Trigger | Does |
|----------|------|---------|------|
| CI | `ci.yml` | PRs + pushes to `main` | `ruby -c` syntax check + `brew style` on the formula |
| Update formula | `update-formula.yml` | manual dispatch, or `repository_dispatch` type `cli-released` | bump the formula to a published CLI version |

## Updating the formula

`update-formula.yml` does the following for a given version:

1. Downloads `https://registry.npmjs.org/@infrapilot/cli/-/cli-<version>.tgz`.
2. Computes its `sha256`.
3. Rewrites the `url` and `sha256` fields in `Formula/infrapilot.rb`.
4. Commits the change to `main` (`contents: write`).

### Triggering it

Manually:

```
Actions → Update formula → Run workflow → version = 0.2.3
```

Automatically from the CLI release in `infrapilot.org` — send a
`repository_dispatch`:

```bash
gh api repos/infrapilothq/homebrew-tap/dispatches \
  -f event_type=cli-released \
  -F client_payload[version]=0.2.3
```

## Platform-wide coordination

This repo is a submodule of the `infrapilot-platform` meta-repo. The end-to-end
chain is: `infrapilot.org` publishes the CLI to npm → this tap's formula is
bumped → users `brew upgrade infrapilot`.
