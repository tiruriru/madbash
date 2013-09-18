#!/bin/bash
#-------------------------------------------------------------------------------
# file: bootstrap.bash
#
# Bootstrap script for mad bash. It clones the repo and installs everything
# in the system.
#-------------------------------------------------------------------------------

MADBASH=${1:-$HOME/.madbash}

if [[ -d $MADBASH ]]; then
    printf "Mad Bash seems to be installed there, wanna force it? [yN]: "
    read </dev/tty
    
    if [[ $REPLY != 'y' ]] && [[ $REPLY != 'Y' ]]; then
	echo "Exiting..." >&2
	exit 1
    else
	echo "Overriding previous installation..."
    fi
fi

echo "Preparing..."
rm -rf $MADBASH
echo "Cloning source code..."
git clone -q git://github.com/tiruriru/madbash.git $MADBASH
echo "Writing user configuration..."
cp $MADBASH/templates/dot.bash_profile $HOME/.bash_profile
echo "Installed!"

echo
source $HOME/.bash_profile
