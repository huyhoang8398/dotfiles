#
# ~/.bash_profile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi
