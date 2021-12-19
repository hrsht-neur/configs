#!/bin/bash
session="kafka-sess"
#test_name = "deepstream_test5"

#dstest
#cd $test_name
cd /home/p0036/kafka

echo $PWD

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $session 2>/dev/null

start_zoo = 'bin/zookeeper-server-start.sh config/zookeeper.properties'
start_srv = 'bin/kafka-server-start.sh config/server.properties'


if [ $? != 0 ]; then
  echo "Session does not exist."
  echo "Creating session: $session ..."
  #tmux new -s $session
  tmux new-session -d -s $session

  window_n=0
  window_name="files"
  echo Renaming window $window_n to $window_name
  tmux rename-window -t $session:$window_n $window_name
  tmux send-keys -t $session:$window_n 'll' C-m

  tmux split-window -t $session:$window_n -h
  tmux split-pane -t $session:$window_n.1 -v
  #tmux send-keys -t $session:$window_n.$pane_n 'll' C-m
  tmux send-keys -t $session:$window_n.1 'bin/zookeeper-server-start.sh config/zookeeper.properties' C-m
  tmux send-keys -t $session:$window_n.2 'bin/kafka-server-start.sh config/server.properties' C-m

  tmux send-keys -t $session:$winow_n.0 'bin/kafka-console-consumer.sh --topic rawdata --from-beginning --bootstrap-server localhost:9092' C-m

  tmux attach -t $session

  #window_n=1
  #window_name="test_exec"
  #echo Creating new window $window_n named $window_name
  #tmux new-window -t $session:$window -n 'vim'
  #pane_n=1
  #tmux split-pane -t $session:$window_n.$pane_n -v
fi

echo Session already exists, attaching to it ...
tmux attach -t $session

#echo Deleting Session
#tmux kill-session -t $session
