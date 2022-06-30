export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting'

zplug 'spaceship-prompt/spaceship-prompt', use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load


# User configuration

# Aliases
alias ll='ls -l'
alias rm='rm -i'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# node version manager
if which n > //dev/null; then
  export N_PREFIX=$HOME/.n
  export PATH=$N_PREFIX/bin:$PATH
fi
