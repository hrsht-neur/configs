#/bin/bash
session="YODA-RW"

tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then

  cd /home/p0036/Code/work/Realwave/export/YODA
  
  source /home/p0036/Code/work/Realwave/YODA/.venv/bin/activate
  
  echo "New tmux Session: $session Started"
  
  tmux new-session -d -s $session
  
  tmux split-window -t $session:0 -h

  tmux send-keys -t $session:0.0 'jupyter notebook' C-m

else
  
  echo "tmux Session already Started"

fi

tmux attach -t $session
