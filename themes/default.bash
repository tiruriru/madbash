#-------------------------------------------------------------------------------
# file: themes/default.bash
#
# My default theme.
#-------------------------------------------------------------------------------

# Color definitions and helpers.
#-------------------------------------------------------------------------------

cr()
{
    echo "\[\033[$1m\]"
}

RED=`cr '0;31'`
GREEN=`cr '0;32'`
YELLOW=`cr '0;33'`
BLUE=`cr '0;34'`
LIGHT_BLUE=`cr '1;34'`
PURPLE=`cr '0;35'`
LIGHT_PURPLE=`cr '1;35'`
GRAY=`cr '0;30'`
RESET=`cr 0`

# Prompt helper functions.
#-------------------------------------------------------------------------------

__git_status()
{
    if [[ $(git status --porcelain) != "" ]]; then
	echo "${PURPLE}+${LIGHT_PURPLE}$1${RESET}"
    else
	echo "${GREEN}$1${RESET}"
    fi
}

__git_ps1()
{
    if `which git >/dev/null` && [ -d .git ]; then
	branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	echo " : git(`__git_status $branch`)"
    fi
}

__ruby_gemset()
{
    if `which rvm >/dev/null`; then
	gemset=$(echo $GEM_HOME | grep -o '@.*')
	[[ ! -z $gemset ]] && echo $gemset
    fi
}

__ruby_ps1()
{
    if `which ruby >/dev/null`; then
	version=$(ruby --version | cut -d' ' -f2)
	[[ ! -z $version ]] && echo " : rb($version$(__ruby_gemset))"
    fi
}

__rc_ps1()
{
    if (( $RET == 0 )); then
	echo "(${GREEN}$RET${RESET})"
    else
	echo "(${RED}$RET${RESET})"
    fi
}

__prompt_cmd()
{
    RET="$?"
    PS1="${LIGHT_BLUE}\u${BLUE}@\h${RESET}"  # user@host
    PS1="$PS1$(__rc_ps1)"                    # last exit code
    PS1="$PS1$(__ruby_ps1)"                  # ruby version (@gemset)
    PS1="$PS1$(__git_ps1)"                   # git branch and status
    PS1="$PS1 : ${YELLOW}\w${RESET}"         # working directory
    PS1="$PS1\n${GRAY}\$${RESET} "           # prompt
}

# Export prompt command.
#-------------------------------------------------------------------------------
export PROMPT_COMMAND=__prompt_cmd
