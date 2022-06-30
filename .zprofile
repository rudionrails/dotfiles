if [ -f /opt/homebrew/bin/brew ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi


# if type brew &>/dev/null; then
#   # export PATH="$(brew --prefix)/opt/ncurses/bin:$PATH"
#   # export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"
#   export FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
# 
#   source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 
#   autoload -Uz compinit
#   compinit
# fi
