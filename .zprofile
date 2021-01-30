eval $(/opt/homebrew/bin/brew shellenv)

if type brew &>/dev/null; then
  export PATH="$(brew --prefix)/opt/ncurses/bin:$PATH"
  export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"
  export FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  autoload -Uz compinit
  compinit

fi

# zsh extensions

# Fast node manager
eval "$(fnm env)"
