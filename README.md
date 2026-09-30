# homebrew-tap

Homebrew tap for [`sweep`](https://github.com/KitsuneKode/sweep) - artifact
cleanup for project trees with a review-first TUI.

## Install

```sh
brew install kitsunekode/tap/sweep
```

## Update the formula (maintainer)

After a release tag `vX.Y.Z` exists with binary assets attached:

```sh
bin/update-formula X.Y.Z
git add Formula/sweep.rb
git commit -m "sweep X.Y.Z"
git push
```

The script downloads each platform's `.sha256` sidecar from the release and
writes the digests into the formula.
