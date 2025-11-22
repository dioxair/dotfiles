#!/bin/bash

song_info=$(mpc --format "%artist% - %title%" current)

echo " $song_info"
