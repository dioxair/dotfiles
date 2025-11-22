#!/bin/bash

song_info=$(mpc --format "%artist% - %title%" current)
state=$(mpc status | awk 'NR==2 {print $1}')

if [[ "$state" == "[paused]" ]]; then
  icon=""
else
  icon=""
fi

echo "$icon $song_info"
