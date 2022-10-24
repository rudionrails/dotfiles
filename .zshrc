setopt autocd

#
# setup zplug to the correct file
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
zplug 'zsh-users/zsh-syntax-highlighting'

zplug 'spaceship-prompt/spaceship-prompt', use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# 
# User configuration
#

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# fuzzy finder
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# node version manager
if which n > /dev/null; then
  export N_PREFIX=$HOME/.n
  export PATH=$N_PREFIX/bin:$PATH
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

#
# Aliases
#
alias ls='ls --color=tty'
alias ll='ls -lh'

alias rm='rm -i'

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
