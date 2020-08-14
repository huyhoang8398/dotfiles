export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/huyhoang8398/.oh-my-zsh"

# NPM install user
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Plugins
#plugins=(git)

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
alias gcl='git clone --recurse-submodules'
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"


# Other Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Useful script
source /home/huyhoang8398/script/open.sh

# Random fortune
fortune | pokemonsay

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/home/huyhoang8398/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# pyWal
# Import colorscheme from 'wal' asynchronously
# # &   # Run the process in the background.
# # ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)


# Starship promt
eval "$(starship init zsh)"
source ~/.cache/wal/colors-tty.sh
