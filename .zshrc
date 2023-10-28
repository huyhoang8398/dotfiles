# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Starship promt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Golang
#export GOPATH=$HOME/go
#export GOROOT="$(brew --prefix golang)/libexec"
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Path to your oh-my-zsh installation.
export ZSH="/Users/kn/.oh-my-zsh"

# Plugins
#plugins=(zsh-autosuggestions zsh-syntax-highlighting)

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Alias 
alias cl="clear"
alias c="code"
alias nv="nvim"
alias gcl='git clone --recurse-submodules'
alias ga="git add"
alias gs="git status"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gcl='git clone --recurse-submodules'

# Starship promt
eval "$(starship init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
