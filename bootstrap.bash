#!/bin/bash
#-------------------------------------------------------------------------------
# file: bootstrap.bash
#
# Bootstrap script for mad bash. It clones the repo and installs everything
# in the system.
#-------------------------------------------------------------------------------

MADBASH=${1:-$HOME/.madbash}

if [[ -d $MADBASH ]]; then
    read -p "Mad Bash seems to be installed there, wanna force it? [yN]: " answer
    
    if [[ $answer != 'y' ]] && [[ $answer != 'Y' ]]; then
	echo "Ok, exiting..." >&2
	exit 1
    fi	
fi

rm -rf $MADBASH
git clone git://github.com/tiruriru/madbash.git $MADBASH
cp $MADBASH/templates/dot.bash_profile $HOME/.bash_profile
source $HOME/.bash_profile
