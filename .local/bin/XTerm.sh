#!/bin/sh

# Check if ssh-agent is running
. "${HOME}/.local/etc/ssh-agent-call"

# Change CWD
cd "${HOME}"

# Exec xterm, use GNU Screen instead of user's shell
exec xterm\
     -e "${HOME}/.screenrc-workspace"\
        -S "${HOSTNAME}-workspace"

exit 1
