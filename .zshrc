export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kn/.oh-my-zsh"
export PATH="/home/kn/script":$PATH

# Plugins
#plugins=(git)

#ZSH_THEME="oxide"
CASE_SENSITIVE="true"

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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# Useful script
source /home/kn/script/open.sh

# Random fortune
#fortune | pokemonsay

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/home/huyhoang8398/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

#zsh uses square brackets for globbing / pattern matching.
alias pip='noglob pip'
alias discord='discord --no-sandbox'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias vim='nvim'
alias s="kitty +kitten ssh"
alias ss="sudo systemctl"
alias update="sudo pacman -Syu"

alias cl="clear"
alias c="code"
alias nv="nvim"
alias s="subl"
alias gcl='git clone --recurse-submodules'
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

