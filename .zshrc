setopt autocd

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Setup zplug to the correct file
#
if [ -d /opt/homebrew/opt/zplug ]; then
  export ZPLUG_HOME=/opt/homebrew/opt/zplug
  source $ZPLUG_HOME/init.zsh
elif [ -d /usr/local/opt/zplug ]; then # for older versions of homebrew
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zs
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
# zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "lib/completion", from:oh-my-zsh

zplug 'romkatv/powerlevel10k', as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# source plugins and add commands to $PATH
zplug load

# 
# User configuration
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias rm='rm -i'
alias grep="grep --color=auto --exclude-dir={.git,.vscode}"

# Preferred editor for local and remote sessions
if which nvim > /dev/null; then
  alias v=nvim
else
  alias v=vim
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# brew install lsd (better ls)
if which exa > /dev/null; then
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

# brew install bat (better cat with colors)
if which bat > /dev/null; then
  alias cat=bat
fi

# brew install btop
if which btop > /dev/null; then
  alias top=btop
fi

# brew install zoxide (for better cd)
# Usage:
#   z path/to/folder
if which zoxide > /dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# tool version manager for Node, Ruby, others
# @see https://asdf-vm.com/
if which asdf > /dev/null; then
  source "$(brew --prefix asdf)/libexec/asdf.sh"
  source "$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"
fi

# # node version manager: https://github.com/tj/n
# if which n > /dev/null; then
#   export N_PREFIX=$HOME/.n
#   export PATH=$N_PREFIX/bin:$PATH
# fi

# # different node version manager
# if which fnm > /dev/null; then
#   eval "$(fnm env --use-on-cd --fnm-dir $HOME/.fnm)"
#   eval "$(fnm completions --shell zsh)"
# fi

# if which rbenv > /dev/null; then
#   eval "$(rbenv init - zsh)"
# fi

# if which pyenv > /dev/null; then
#   # export PATH="$HOME/.pyenv/bin:$PATH"
#   eval "$(pyenv init -)"
# fi
