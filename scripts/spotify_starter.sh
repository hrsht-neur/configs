#!/bin/bash
session="spotify-plus-sess"
#test_name = "deepstream_test5"

echo $PWD

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then
  echo "Session does not exist."
  echo "Creating session: $session ..."

  tmux new-session -d -s $session

  window_n=0
  window_name="spotify"
  echo Renaming window $window_n to $window_name
  tmux rename-window -t $session:$window_n $window_name
  tmux send-keys -t $session:$window_n 'ncspot' C-m
  tmux split-window -t $session:$window_n -h
  echo Attaching $session
  tmux attach -t $session
fi

echo Session already exists, attaching to it ...
tmux attach -t $session

#echo Deleting Session
#tmux kill-session -t $session
