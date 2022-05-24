#!/bin/bash

DOW=$(date +%u)

newWorkspace() {
  echo "Pushing app to new Workspace"
  xdotool key "Control_L+Alt_L+Shift_L+Up"
}
runWeekdayOnly() {
  if [ $DOW = 6 ] || [ $DOW = 7 ]; then
    exit 0
  fi
}

runWeekdayOnly

slack

wait $BACK_PID && newWorkspace
