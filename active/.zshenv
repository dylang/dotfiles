#
# Defines environment variables.
#

################################################################################
# Paths
################################################################################

typeset -gU cdpath fpath mailpath path

#
# paths searched for manual pages
#

MANPATH=$HOME/.homebrew/share/man:$MANPATH

#
# paths searched for programs
#

path=(
  $HOME/.homebrew/bin
  /usr/local/{bin,sbin}
  $path
)

#
# paths searched to auto-cd into
#

cdpath=(
  $HOME
  $HOME/Documents/projects
  $cdpath
)

################################################################################
# terminal
################################################################################

export TERM=xterm-256color

################################################################################
# browser
################################################################################

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

################################################################################
# editors & pagers
################################################################################

#
# default editor
#

export EDITOR='vim -p'
export VISUAL='vim -p'

#
# default pager
#

export PAGER='vimpager'

#
# `less` configuration
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

################################################################################
# language
################################################################################

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

################################################################################
# temporary Files
################################################################################

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

