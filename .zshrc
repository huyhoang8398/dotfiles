# Path to your oh-my-zsh installation.
export ZSH="/home/kn/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Other Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ssh="kitty +kitten ssh"
alias cl="clear"
alias nv="nvim"
alias gcl='git clone --recurse-submodules'
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"

source /usr/share/doc/pkgfile/command-not-found.zsh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Golang
export PATH=$PATH:/usr/local/go/bin

# Personal Script
export PATH=$PATH:/home/kn/dev/script

# Ignore duplicate in history when run find (or FZF)
setopt HIST_FIND_NO_DUPS

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Promt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"
