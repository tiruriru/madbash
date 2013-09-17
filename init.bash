#-------------------------------------------------------------------------------
# file: init.bash
#
# Mad Bash initializer and defaults.
#-------------------------------------------------------------------------------

echo -n "Loading Mad Bash: "

# Set correct path.
#-------------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH

# Load theme.
#-------------------------------------------------------------------------------
source $MADBASH/themes/${THEME}.bash

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
