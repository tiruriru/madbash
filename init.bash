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
if [[ $PLUGINS == 'all' ]]; then
    PLUGINS=$(ls -1 $MADBASH/plugins | grep '.bash$' | sed -e 's/\.bash//')
fi

for plugin in $PLUGINS; do
    echo -n .
    source $MADBASH/plugins/${plugin}.bash
done

echo
