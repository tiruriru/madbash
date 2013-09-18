#-------------------------------------------------------------------------------
# file: init.bash
#
# Mad Bash initializer and defaults.
#-------------------------------------------------------------------------------

VERSION="0.0.1"

echo -n "Loading Mad Bash (v$VERSION): "

# Global functions and helpers.
#-------------------------------------------------------------------------------
madbash() {
    case "$1" in
	"plugins")
	    ls -1 $MADBASH/plugins | grep '.bash$' | sed -e 's/\.bash//'
	    ;;
	"reload")
	    source $MADBASH/init.bash
	    ;;
	"version")
	    echo "Mad Bash v$VERSION"
	    ;;
	"help")
	    echo "Usage: madbash <action>"
	    echo "Available actions: help, plugins, reload, version"
	    ;;
	*)
	    echo "ERR -- invalid action" >&2
	    madbash help
	    return 1
	    ;;
    esac
}

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
    PLUGINS=$(madbash plugins)
fi

for plugin in $PLUGINS; do
    echo -n .
    source $MADBASH/plugins/${plugin}.bash
done

echo
