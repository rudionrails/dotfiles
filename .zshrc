setopt autocd

# TODO: https://github.com/tmuxinator/tmuxinator
if [[ $+commands[tmux] == "1" ]]; then
  # Automatically run tmux every time zsh is loaded
  : ${TMUX_AUTOSTART:=true}
  # Exit terminal when tmux session exits
  : ${TMUX_AUTOQUIT:=false}

  # Run the below if enabled and not already in tmux, vim, etc.
  if [[ "$TMUX_AUTOSTART" == "true" && -z "$TMUX" && -z "$VIM" ]]; then
    tmux new-session -A # -s home

    if [[ "$TMUX_AUTOQUIT" == "true" ]]; then
      exit
    fi
  fi
fi

# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

if [[ $+commands[brew] == "0" ]]; then
  # if [[ "$(uname -m)" == "x86_64" ]]; then
  #   if [[ -f /usr/local/Homebrew/bin/brew ]]; then
  #     eval $(/usr/local/Homebrew/bin/brew shellenv)
  #   fi
  # else
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  fi
  #
  #   # FIXME: This is only for HBL IBM package. Remove once done.
  #   alias brew86="arch -x86_64 /usr/local/bin/brew"
  # fi
fi

if [[ $+commands[git] == "0" ]]; then
  print "zsh: git command not found. Install git to load zsh correctly." >&2
  return 1
fi

#
# Setup zinit plugin manager
# @see https://github.com/zdharma-continuum/zinit
#
# # Self update
# zinit self-update
# 
# # Plugin update
# zinit update
#
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "${ZINIT_HOME}" ]; then
  mkdir -p "$(dirname ${ZINIT_HOME})"
  git clone https://github.com/zdharma-continuum/zinit.git --depth=1 "${ZINIT_HOME}"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab # use fzf on tab completion, see https://github.com/Aloxaf/fzf-tab
zinit ice depth=1; zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light zsh-users/zsh-completions

# OMZ = shorthand for oh-my-szh, @see https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#migration
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::plugins/colored-man-pages

autoload -U compinit && compinit

zinit cdreplay -q

# 
# User configuration

# TODO:: p10k is not maintained anymore, switch to oh-my-posh
# Enable prompt
if [[ $+commands[oh-my-posh] == "1" && "$TERM_PROGRAM" != "Apple_Terminal" ]]; then
  # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/tokyonight.toml)"
  # eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/wopian.toml)"
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/daywalker.toml)"
  # eval "$(oh-my-posh init zsh)"
fi

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf-tab configuration
#
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always --tree --depth 2 $realpath'
# # switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
# # make use of tmux popup
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

alias rm='rm -i'

# Preferred editor for local and remote sessions
#   brew install nvim
if [[ $+commands[nvim] == "1" ]]; then
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

  alias vim="nvim"
  alias v=nvim
else
  export EDITOR='vim'
  alias v=vim
fi

# Tool version manager for Node, Ruby, others (alternative to asdf)
#   brew install mise
#
# @see https://mise.jdx.dev/
if [[ $+commands[mise] == "1" ]]; then
  eval "$(mise activate zsh)"
fi

# Better cat with colors
#   brew install bat
if [[ $+commands[bat] == "1" ]]; then
  # bat with light/dark mode theme for macOS
  alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo tokyonight_moon || echo tokyonight_day)"
fi

# Better top
#   brew install btop
# @see https://github.com/aristocratos/btop
if [[ $+commands[btop] == "1" ]]; then
  alias top=btop
fi

# better df (display free disk space)
#   brew install duf
# @see https://github.com/muesli/duf
if [[ $+commands[duf] == "1" ]]; then
  alias df=duf
fi

# better du (disk usage satistics)
#   brew install dust
# @see https://github.com/bootandy/dust
if [[ $+commands[dust] == "1" ]]; then
  alias du="dust -r"
fi

# Better ls
#   brew install lsd
# @see https://github.com/lsd-rs/lsd
if [[ $+commands[lsd] == "1" ]]; then
  alias ls="lsd --group-dirs=first"
  alias l="ls -1"
  alias ll="l -l"
  alias la="l -a"
  alias lt="l --tree -I .git -I node_modules"
else
  echo "Get better `ls` output by `brew install lsd`"

  alias ls="ls -G"
  alias l="ls"
  alias ll="ls -lh"
  alias la="ls -a"
  alias lt="ls"
fi

# Better grep
#   brew install ripgrep
if [[ $+commands[rg] == "1" ]]; then
  alias grep=rg
else
  alias grep="grep --color=auto --exclude-dir={.git,.vscode}"
fi

# better cd
#   brew install zoxide
# @see https://github.com/ajeetdsouza/zoxide
if [[ $+commands[zoxide] == "1" ]]; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Command-line fuzzy finder
#   brew install fzf
# @see https://github.com/junegunn/fzf
if [[ $+commands[fzf] == "1" ]]; then
  eval "$(fzf --zsh)"

  # export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

  # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }

  # Advanced customization of fzf options via _fzf_comprun function
  # - The first argument to the function is the name of the command.
  # - You should make sure to pass the rest of the arguments to fzf.
  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
      cd) fzf --preview 'lsd --group-dirs=first --color=always --tree --depth 2 {} | head -200' "$@" ;;
      # *)  fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
      *)  fzf "$@" ;;
    esac
  }
fi
