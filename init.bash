#-------------------------------------------------------------------------------
# file: init.bash
#
# Mad Bash initializer and defaults.
#-------------------------------------------------------------------------------

echo -n "Loading Mas Bash: "

# Set correct path.
#-------------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH

# Load theme.
#-------------------------------------------------------------------------------
source $MADBASH/themes/${THEME}.bash

# Default aliases.
#-------------------------------------------------------------------------------
alias edit="$EDITOR"
alias e='edit'
alias ls='ls -G'
alias la='ls -AF'
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias c='clear'
alias q='exit'
alias md='mkdir -p'
alias rd='rmdir'
alias h='history'
alias ..='cd ..'
alias ...='cd ../..'
alias _='sudo'

# Set some global helper constants.
#-------------------------------------------------------------------------------
OS=`uname -s`

# Load plugins.
#-------------------------------------------------------------------------------
for plugin in $PLUGINS; do
    echo -n .
    source $MADBASH/plugins/${plugin}.bash
done

echo
