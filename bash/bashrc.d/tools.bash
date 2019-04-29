#!/bin/bash
####################################################################
# tools.bash
# -----------
# Shell configurations for various tools
#
####################################################################

# Make less more friendly for non-text input files; see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Attach to existing tmux sessions (instead of creating a new session)
#if hash tmux 2>/dev/null ; then
#    tmux() {
#        # If sessions exist, default the arguments to the attach-session command
#        if ! (($#)) && command tmux has-session 2>/dev/null ; then
#            command tmux attach-session -d
#
#        # Otherwise, just call tmux directly with the given arguments
#        else
#            command tmux "$@"
#        fi
#    }
#fi

# Always use vim instead of ex, vi, or view
#if ! hash vim 2>/dev/null ; then
#    alias ex='vim -e'
#    alias vi='vim'
#    alias view='vim -R'
#fi
