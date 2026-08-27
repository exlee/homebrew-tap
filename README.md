# exlee's Homebrew tap

```sh
brew install --cask exlee/tap/race
```

[RACE](https://race-term.com/) is a canvas workspace holding terminals.

Upgrades come with the usual `brew upgrade --cask race`. The cask downloads the
signed, notarized, immutable
`https://downloads.race-term.com/releases/vX.Y.Z/RACE.zip` object that the RACE
release pipeline writes, so a version's bytes never change under it.

`Casks/race.rb` is written by the RACE release workflow. Edit it at its source
rather than here — a hand-edit is overwritten by the next release.
