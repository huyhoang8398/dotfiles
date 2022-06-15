export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kn/.oh-my-zsh"
export PATH="/home/kn/script":$PATH

# Golang
export PATH="$PATH:$HOME/go/bin"

# NPM 
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Plugins
#plugins=(git)

ZSH_THEME="oxide"

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

# Alias 
alias cl="clear"
alias c="code"
alias nv="nvim"
alias s="subl"
alias gcl='git clone --recurse-submodules'
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias sl="systemctl suspend"

# Other Plugins
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

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
