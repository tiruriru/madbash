#-------------------------------------------------------------------------------
# file: themes/default.bash
#
# My default theme.
#-------------------------------------------------------------------------------

cr()
{
    echo "\[\033[$1m\]"
}

cc()
{
    cr 0
}

__git_status()
{
    if [[ $(git status --porcelain) != "" ]]; then
	echo "$(cr '0;35')+$(cr '1;35')$1$(cc)"
    else
	echo "$(cr '0;32')$1$(cc)"
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
	echo "($(cr '0;32')$RET$(cc))"
    else
	echo "($(cr '0;31')$RET$(cc))"
    fi
}

__prompt_cmd()
{
    RET="$?"
    PS1="$(cr '1;34')\u$(cr '0;34')@\h$(cc)" # user@host
    PS1="$PS1$(__rc_ps1)"                    # last exit code
    PS1="$PS1$(__ruby_ps1)"                  # ruby version (@gemset)
    PS1="$PS1$(__git_ps1)"                   # git branch and status
    PS1="$PS1 : $(cr '0;33')\w$(cc)"         # working directory
    PS1="$PS1\n$(cr '0;30')\$$(cc) "         # prompt
}

export PROMPT_COMMAND=__prompt_cmd
