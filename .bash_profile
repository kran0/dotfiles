# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -z "${PREFIX}" ]
then
 # Termux detected
 export TERMUX_ENVIRONMENT='true'
 . "${HOME}/.local/etc/ssh-agent-call"
fi

export PATH=${PATH}:${HOME}/.local/bin
#export VISUAL="vim -u $HOME/.vimrc"
#export EDITOR="$VISUAL"
