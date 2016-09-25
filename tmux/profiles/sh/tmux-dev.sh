#!/bin/bash

############################################################################## 
# tmux-dev.sh
# ------------
# Shell script for creating new tmux session using current directory name.
# Session also creates the appropriate windows and split panes as specified.
# 
# tmux session layout for development:
#     tmux new-session -d -s dev       # Create new session named 'dev'
#     tmux split-window -h -p 25       # Split pane 1 vertically by 25%
#     tmux split-window -v -p 30       # Split pane 2 horizontally by 30%
#     tmux select-pane -t 1            # Select first pane
#     tmux -2 attach-session -d        # Attach session
##############################################################################

function tmux_dev {
 SESSION_NAME=$1

 tmux new-session -s $SESSION_NAME -d  # Create new session.
 tmux split-window -h -p 25            # Split pane 1 vertically by 25%.
 tmux split-window -v -p 30            # Split pane 2 horizontally by 30%.
 tmux select-pane -t 1                 # Select pane 1.
 tmux attach -t $SESSION_NAME          # Attach and start session.
}


# Create new session with current directory name '$DIR_NAME'.
DIR_NAME=${PWD##*/}

tmux has-session -t $DIR_NAME 2>/dev/null
if [ $? -eq 1 ]
then
  tmux_dev $DIR_NAME
else
  # Random string as new session suffix.
  #RAND_SUFFIX=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 2 | head -n 1)
  echo "ERROR: tmux session already exists."
  #echo "Creating session with name '$DIR_NAME:$RAND_SUFFIX'..."
  #tmux_dev "$DIR_NAME:$RAND_SUFFIX"
fi
