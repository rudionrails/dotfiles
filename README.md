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

- [`bat`](https://github.com/sharkdp/bat) better `cat` with syntax highlighting and git integration
- [`btop`](https://github.com/aristocratos/btop) better `top` resource monitor
- [`duf`](https://github.com/muesli/duf) better `df` free disk space utility
- [`dust`](https://github.com/bootandy/dust) better `du` disk usage statistics
- [`delta`](https://github.com/dandavison/delta) syntax-highlighting pager for git, diff, grep, and blame output
- [`fzf`](https://junegunn.github.io/fzf/) command-line fuzzy finder
- [`git`](https://git-scm.com/) distributed version control system (integrated with
- [`lsd`](https://github.com/lsd-rs/lsd) better `ls` with colors, icons, tree-view, more formatting options
- [`mise`](https://mise.jdx.dev/) the polyglot tool version manager
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) recursively searches directories for a regex pattern while respecting your gitignore
- [`tmux`](https://github.com/tmux/tmux/wiki) terminal multiplexer to switch easily between several programs
- [`tokei"`](https://docs.rs/tokei/latest/tokei/) utility to count code in directories
- [`yazi`](https://github.com/sxyazi/yazi) terminal file manager
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) smarter cd command, inspired by z and autojump
- [`zsh`](https://www.zsh.org/) shell designed for interactive use (using [`zplug`](https://github.com/zplug/zplug) and [`powerlevel10k`](https://github.com/romkatv/powerlevel10k))

## Additional resources

- https://github.com/cdleon/awesome-terminals
- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/k4m4/terminals-are-sexy
- https://github.com/unixorn/awesome-zsh-plugins
- https://github.com/rockerBOO/awesome-neovim
