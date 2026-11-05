# Homebrew tap for Bestcast

```sh
brew trust --tap pcstyle-os/bestcast
brew tap pcstyle-os/bestcast
brew install --cask bestcast            # Apple silicon
brew install --cask bestcast-universal  # Intel
brew install --cask bestcast@beta       # beta channel, beside stable
```

The casks are bumped automatically by the
[release workflow](https://github.com/pcstyle-os/bestcast/blob/main/.github/workflows/release.yml).
Keep the two-space indent on the `version` and `sha256` lines; the workflow's `sed` anchors on it.
