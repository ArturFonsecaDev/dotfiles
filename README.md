# Dotfiles

Personal development environment shared between Linux and macOS.

This repository is organized for [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a package that maps files into `$HOME`.

## Packages

| Package | Target | Notes |
| --- | --- | --- |
| `kitty` | `~/.config/kitty` | Kitty terminal config, themes, tabs, windows, and portable shortcuts. |
| `nvim` | `~/.config/nvim` | LazyVim-based Neovim config with Laravel tooling. |
| `zsh` | `~/.zshrc` | Shell aliases, prompt, NVM, and terminal helpers. |

## Install Stow

Linux:

```sh
sudo apt install stow
```

macOS:

```sh
brew install stow
```

## Apply Configs

Run from this repository:

```sh
stow kitty
stow nvim
stow zsh
```

If a file already exists in `$HOME`, back it up before running `stow`.

## Kitty Shortcuts

Tabs:

```text
ctrl+shift+t       new tab in current directory
ctrl+shift+right   next tab
ctrl+shift+left    previous tab
ctrl+shift+.       move tab forward
ctrl+shift+,       move tab backward
ctrl+shift+alt+t   rename tab
ctrl+shift+q       close tab
ctrl+shift+p       select tab
ctrl+shift+1..9    jump to tab number
```

Windows inside a tab:

```text
ctrl+shift+enter   new window in current directory
ctrl+shift+]       next window
ctrl+shift+[       previous window
ctrl+shift+w       close window
ctrl+shift+l       next layout
```

Reload Kitty from inside Kitty:

```sh
kill -SIGUSR1 "$KITTY_PID"
```

## GitHub

This repo is local for now. To publish later:

```sh
git remote add origin git@github.com:<user>/dotfiles.git
git push -u origin main
```
