#!/bin/bash

FILE="tasks.txt"

case $1 in
  add)
    echo "$2" >> $FILE
    echo "Task added: $2"
    ;;
  list)
    nl -w2 -s'. ' $FILE
    ;;
  delete)
    sed -i "${2}d" $FILE
    echo "Task $2 deleted"
    ;;
  *)
    echo "Usage: $0 {add|list|delete} [task]"
    ;;
esac
