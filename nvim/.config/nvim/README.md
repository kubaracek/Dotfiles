# Kuba's Neovim config

## Cheatsheat

### Cleaning up cache

```
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

### Package Manager

Mason is used together with Lazy.

Packages should either be defined in `chadrc.lua` for Mason or `plugins/init.lua` for Lazy.

Mason Install new packages
```
:MasonInstallAll
```

Lazy installs new packages automatically after neovim restart.

To open Lazy
```
:Lazy
```
