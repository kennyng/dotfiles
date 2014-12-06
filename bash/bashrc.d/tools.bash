#!/bin/bash
####################################################################
# tools.bash
# -----------
# Shell configurations for various tools.
#
####################################################################

# Enable color support for ls and grep (on Linux, specific to GNU corutils).
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    # WARNING: enabling grep colors messes up git-completion
    # alias grep='grep --color=auto'
    # alias fgrep='fgrep --color=auto'
    # alias egrep='egrep --color=auto'
fi

# Make less more friendly for non-text input files; see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Attach to existing tmux sessions (if possible) instead of create new.
if hash tmux 2>/dev/null ; then
    tmux() {
        # If sessions exist, default the arguments to the attach-session command
        if ! (($#)) && command tmux has-session 2>/dev/null ; then
            command tmux attach-session -d

        # Otherwise, just call tmux directly with the given arguments
        else
            command tmux "$@"
        fi
    }
fi

# Always use vim instead of ex, vi, or view.
if ! hash vim 2>/dev/null ; then
    alias ex='vim -e'
    alias vi='vim'
    alias view='vim -R'
fi

