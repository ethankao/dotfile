#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
  echo "======================= BYEBYE ======================="
  exit
}

function watchandrun() {
  while true ; do
    echo "======================= READY ======================="
    fswatch -1 ./ -e ".*" -i ".m$" -i ".h$" -i ".mm$" && $@
    echo "======================= Done  =======================" ; echo
  done
}

echo $@

watchandrun $@

