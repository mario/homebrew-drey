# homebrew-drey

Homebrew tap for [drey](https://github.com/mario/drey): one language server per
workspace, shared by every editor and agent.

```sh
brew install mario/drey/drey
```

That is the whole tap. The source, the issue tracker and the documentation all
live in the [main repository](https://github.com/mario/drey); file bugs there
rather than here, unless the problem is the formula itself.

## What you get

A single binary in two roles. Point any LSP client at `drey serve rust-analyzer`
where it currently names `rust-analyzer`, and it attaches to a shared server
instead of starting its own. `drey status` shows what is running.

The formula builds from source and declares `depends_on "rust" => :build`, so
Homebrew installs the Rust toolchain as a build dependency and removes it
afterwards if nothing else needs it. If you are here for gopls, tsserver,
clangd or jdtls, you never have to think about Rust.

Expect a couple of minutes for the build. There are no prebuilt bottles yet.

## Updating

```sh
brew update && brew upgrade drey
```

## Licence

The formula is Apache-2.0, matching drey itself.
