# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -z "${TERMUX_ENVIRONMENT}" ] && [ -s "${HOME}/.termux/termux.properties" ]
then
 # Termux detected
 export TERMUX_ENVIRONMENT='true'
 . "${HOME}/.local/etc/ssh-agent-call"
fi

export PATH=${HOME}/.local/sbin:${PATH}:${HOME}/.local/bin
