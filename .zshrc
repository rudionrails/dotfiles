setopt autocd

# Setting Term profile, so that nvim can detect the colorscheme
: ${TERM_COLOR_SCHEME:="nightfox"}
if [[ -n "$ITERM_COLOR_SCHEME" ]]; then
  TERM_COLOR_SCHEME=${ITERM_COLOR_SCHEME}
fi

export TERM_PROFILE

# TODO: https://github.com/tmuxinator/tmuxinator
#
# Taken from ohmyzsh
#   @see https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/tmux/tmux.plugin.zsh
#
# Enable tmux
: ${TMUX_ENABLED:=true}
# Automatically attach to a previous session (if it exists)
: ${TMUX_AUTOATTACH:=true}
# Exit terminal when tmux session exits
: ${TMUX_AUTOEXIT:=true}
# Set the default tmux session name
# : ${TMUX_DEFAULT_SESSION_NAME:=default}
if [[ $+commands[tmux] && "$TMUX_ENABLED" == "true" && -z "$TMUX" ]]; then
  if [[ -n "$TMUX_DEFAULT_SESSION_NAME" ]]; then
    [[ "$TMUX_AUTOATTACH" == "true" ]] && tmux attach -t $TMUX_DEFAULT_SESSION_NAME
  else
    [[ "$TMUX_AUTOATTACH" == "true" ]] && tmux attach
  fi

  if [[ $? -ne 0 ]]; then
    if [[ -n "$TMUX_DEFAULT_SESSION_NAME" ]]; then
      tmux new-session -s $TMUX_DEFAULT_SESSION_NAME
    else
      tmux new-session
    fi
  fi

  if [[ "$TMUX_AUTOEXIT" == "true" ]]; then
    exit
  fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Setup zplug to the correct file
#
source "$(brew --prefix zplug)/init.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug "lib/completion", from:oh-my-zsh
zplug 'romkatv/powerlevel10k', as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug instal
fi

# source plugins and add commands to $PATH
zplug load

# 
# User configuration
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias rm='rm -i'

# Preferred editor for local and remote sessions
#   brew install nvim
if [[ $+commands[nvim] ]]; then
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

  alias v=nvim
else
  alias v=vim
fi

# Tool version manager for Node, Ruby, others
#   brew install asdf
#
# @see https://asdf-vm.com/
if [[ $+commands[asdf] ]]; then
  source "$(brew --prefix asdf)/libexec/asdf.sh"
  source "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"
fi

# Better cat with colors
#   brew install bat
if [[ $+commands[bat] ]]; then
  alias cat=bat
fi

# Better top
#   brew install btop
# @see https://github.com/aristocratos/btop
if [[ $+commands[btop] ]]; then
  alias top=btop
fi

# better df
#   brew install duf
# @see https://github.com/muesli/duf
if [[ $+commands[duf] ]]; then
  alias df=duf
fi

# Better ls
#   brew install lsd
# @see https://github.com/lsd-rs/lsd
if [[ $+commands[lsd] ]]; then
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
if [[ $+commands[rg] ]]; then
  alias grep=rg
else
  alias grep="grep --color=auto --exclude-dir={.git,.vscode}"
fi

# better cd
#   brew install zoxide
# @see https://github.com/ajeetdsouza/zoxide
if [[ $+commands[zoxide] ]]; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Spotify for terminal
#   brew install spotify-tui
# @see https://github.com/Rigellute/spotify-tui
# if [[ $+commands[spt] ]]: then
#   eval "$(spt --completions zsh)"
# fi
