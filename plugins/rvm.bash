#-------------------------------------------------------------------------------
# file: plugins/rvm.bash
#
# Ruby Version Manager loader and custom aliases.
#-------------------------------------------------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && {

# Load RVM into a shell session *as a function*.
#-------------------------------------------------------------------------------
source "$HOME/.rvm/scripts/rvm"

# Custom aliases.
#-------------------------------------------------------------------------------
alias rb20='rvm use 2.0'
alias rb19='rvm use 1.9.3'
alias rbin='rvm install'
alias rbun='rvm uninstall'
alias rbse='rvm use'
alias rbgs='rvm gemset'
alias rbgu='rvm gemset use'

}
