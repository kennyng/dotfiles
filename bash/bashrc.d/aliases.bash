#!/bin/bash
####################################################################
# aliases.bash
# ------------
# Global bash alias definitions.
#
####################################################################

# Aliases for ls.
alias ll='ls -ahlF'
alias lh='ls -hlF'
alias la='ls -A'
alias l='ls -CF'

# Prompt before overwriting/removing file.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Use a unified format for diff(1) by default.
alias diff='diff -u'

# Source tmux development profile.
if [ -f $HOME/.tmux/profiles/sh/tmux-dev.sh ]; then
    alias tmux-dev='bash $HOME/.tmux/profiles/sh/tmux-dev.sh'
fi
