#
# Defines environment variables.
#

################################################################################
# program search path
################################################################################

typeset -gU cdpath fpath mailpath path

#
# paths searched for programs
#

path=(
  /usr/local/{bin,sbin}       # obviously :)
  $HOME/.homebrew/{bin,sbin}  # homebrew@$HOME
  /usr/local/heroku/bin       # heroku toolbelt
  $path                       # system defaults
)

################################################################################
# manual page search path
################################################################################

#
# homebrew
#

MANPATH=$HOME/.homebrew/share/man:$MANPATH

#
# erlang
#

MANPATH=$(brew --prefix erlang)/lib/erlang/man:$MANPATH

################################################################################
# auto `cd` paths
################################################################################

cdpath=(
  $HOME                 # ~/
  $HOME/projects/active # active projects
  $cdpath               # default
)

################################################################################
# programming languages
################################################################################

#
# groovy
#

export GROOVY_HOME=$(brew --prefix)/opt/groovy/libexec

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

################################################################################
# application development variables
################################################################################

#
# HNav Client
# TODO: create an ignored "private" file that is sourced (i.e. should not expose this IP address).
#

export HNAVC_DEFAULT_QUERYSTRING='profile=dev&service.hydra.rewriteIp=10.243.41.245'
