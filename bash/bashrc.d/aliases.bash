#!/bin/bash
####################################################################
# aliases.bash
# ------------
# Global Bash alias definitions
#
####################################################################

# Aliases for `ls`
alias ll='ls -ahlF'
alias lh='ls -hlF'
alias la='ls -A'
alias l='ls -CF'

# Prompt before overwriting/removing file
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Use a unified format for diff(1) by default
alias diff='diff -u'
