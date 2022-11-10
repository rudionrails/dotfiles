setopt autocd

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

zplug "lib/completion", from:oh-my-zsh
# zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
# zplug "zsh-users/zsh-history-substring-search", defer:3

# zplug 'spaceship-prompt/spaceship-prompt', use:spaceship.zsh, from:github, as:theme
zplug 'romkatv/powerlevel10k', as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

# 
# User configuration
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
# Aliases
#

# check if gls command is installed, `brew install coreutils`
if which gls > /dev/null; then
  alias ls='gls -lh --color=auto --group-directories-first'
else
  alias ls='ls -G'
fi

# alias ls='ls --color=tty'
alias ll='ls -lh'
alias rm='rm -i'
alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# node version manager
if which n > /dev/null; then
  export N_PREFIX=$HOME/.n
  export PATH=$N_PREFIX/bin:$PATH
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init - zsh)"
fi

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
