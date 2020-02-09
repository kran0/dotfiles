#!/bin/sh

# Check if ssh-agent is running
. "${HOME}/.local/etc/ssh-agent-call"

# Change CWD
cd "${HOME}"

# Exec xterm, use GNU Screen instead of user's shell
exec xterm\
     -e screen\
        -c ~/.screenrc-tabber\
        -s 'menu'\
        -S "${HOSTNAME}-tabber"\
        -qDRO

exit 1
