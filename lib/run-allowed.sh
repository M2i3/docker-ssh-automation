#!/bin/bash
echo "${SSH_ORIGINAL_COMMAND}" >> /tmp/lastcmd
if grep -Fx "${SSH_ORIGINAL_COMMAND}" $HOME/.ssh/allowed_commands > /dev/null; then
  $SSH_ORIGINAL_COMMAND
else
	echo "sorry you are not allowed to perform this action"
	exit 1
fi
