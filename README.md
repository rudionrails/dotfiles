# dotfiles

My personal dotfiles, specific for macOS

## Installation

This repository uses [`yadm`](https://yadm.io).

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add yadm
brew install yadm

# clone and bootstrap
yadm clone --bootstrap https://github.com/rudionrails/dotfiles.git
```

## Applications

- [`Raycast`](https://www.raycast.com/) blazingly fast, totally extendable launcher
- [`Logseq`](https://logseq.com/) privacy-first, open-source platform for knowledge management and collaboration
- [`WezTerm`](https://wezfurlong.org/wezterm/) powerful cross-platform terminal emulator and multiplexer written in Rust
- [`NeoVim`](https://neovim.io/) hyperextensible Vim-based text editor
- [`yabai`](https://github.com/koekeishiya/yabai) tiling window manager for macOS based on binary space partitioning
- [`skhd`](https://github.com/koekeishiya/skhd) hotkey daemon for macOS that focuses on responsiveness and performance

### Terminal-specific applications

Check `~/.zshrc` for more details

- [`asdf`](https://asdf-vm.com/) the multiple runtime version manager for programming languages
- [`bat`](https://github.com/sharkdp/bat) better `cat` with syntax highlighting and git integration
- [`btop`](https://github.com/aristocratos/btop) better `top` resource monitor
- [`duf`](https://github.com/muesli/duf) better `df` disk usage utility
- [`git`](https://git-scm.com/) distributed version control system (integrated with [`delta`](https://github.com/dandavison/delta))
- [`lsd`](https://github.com/lsd-rs/lsd) better `ls` with colors, icons, tree-view, more formatting options
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) recursively searches directories for a regex pattern while respecting your gitignore
- [`tmux`](https://github.com/tmux/tmux/wiki) terminal multiplexer to switch easily between several programs
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) smarter cd command, inspired by z and autojump
- [`Zsh`](https://www.zsh.org/) shell designed for interactive use (using [`zplug`](https://github.com/zplug/zplug) and [`powerlevel10k`](https://github.com/romkatv/powerlevel10k))

## Additional resources

- https://github.com/cdleon/awesome-terminals
- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/k4m4/terminals-are-sexy
