# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin

export PATH

#export VISUAL="vim -u $HOME/.vimrc"
#export EDITOR="$VISUAL"