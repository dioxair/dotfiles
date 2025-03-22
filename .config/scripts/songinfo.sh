#!/bin/sh

# packages for this and my wider music config:
# mpd
# mpc
# mpd-mpris
# ncmpcpp
# ffmpeg
# make sure to run systemctl --user --now enable mpd-mpris to get mpd playerctl support running on startup!

music_dir="$HOME/Music"
album_covers_dir="$HOME/.cache/ncmpcpp/album-covers"
filename="$(mpc --format "$music_dir"/%file% current)"
cover_filename="$album_covers_dir/$(mpc --format %album% current | base64).png"

mkdir -p "$album_covers_dir"

[ -e "$cover_filename" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$cover_filename" > /dev/null 2>&1

notify-send -r 27072 -h string:bgcolor:#101010 -h string:fgcolor:#ffffff -h string:frcolor:#404040 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$cover_filename"
