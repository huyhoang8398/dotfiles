# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/huyhoang8398/.oh-my-zsh"

# ZSH theme
ZSH_THEME="oxide"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

########## ALIAS #########
alias cl="clear"
# fix scp on zsh 
alias s="subl"
alias c="code"
alias nv="nvim"
alias open="xdg-open"

# Other Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/home/huyhoang8398/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
