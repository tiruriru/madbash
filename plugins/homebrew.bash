#-------------------------------------------------------------------------------
# file: plugins/homebrew.bash
#
# OSX's Homebrew aliases and extras.
#-------------------------------------------------------------------------------

[[ $OS == 'Darwin' ]] && {

# Custom aliases.
#-------------------------------------------------------------------------------
alias brup='brew update && brew upgrage'
alias brin='brew install'
alias brun='brew uninstall'
alias brls='brew list'
alias brse='brew search'
alias brin='brew info'
alias brdr='brew doctor'

}
