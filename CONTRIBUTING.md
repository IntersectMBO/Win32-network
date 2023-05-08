# Building

The project is build with `cabal-install`.  You might need to run `cabal
update` after cloning the repository (to update [`Cardano Haskell
Packages`][CHaP] (`ChaP`) index).

# Using in your project

The package is published to [`CHaP`][CHaP].  If you want to pull it from
[`CHaP`][CHaP], this is relatively easy to setup; for example, checkout the
[`cabal.project`](https://github.com/input-output-hk/typed-protocols/blob/master/cabal.project)
file.  Alternatively, you can relay on `source-repository-package` stanza in
a `cabal.project` file.

Note that this project will be deprecated once [WinIO] is mature enough and
thus it won't be published to `hackage`.

# Code Style

Please follow local style.  For a more detailed style guide see
[link][style-guide].

# Pull Requests

Each commit shall be small and preferably address one thing at a time.  Well
organised & documented commits make it much easier for the maintainers to
review them.

New features should be well documented & tested, which means including new
tests as necessary.  You might be asked by the maintainers to write & include
additional tests.

Each commit should build & test, at least the package you are changing.  You
can update other packages from this repository in a subsequent commit.

Please use a draft PRs if the work is still in progress.

If your pull requests resolves an existing issue, please link your PR to that
issue, see [GitHub documentation][gh-link-issue].

# Core Maintainers

Core maintainers are listed in the [Win32-network.cabal] file.

[CHaP]: https://github.com/input-output-hk/cardano-haskell-packages/
[style-guide]: https://github.com/input-output-hk/ouroboros-network/blob/master/docs/StyleGuide.md
[WinIO]: https://gitlab.haskell.org/ghc/ghc/-/merge_requests/1224
[Win32-network.cabal]: https://github.com/input-output-hk/Win32-network/blob/master/Win32-network.cabal
