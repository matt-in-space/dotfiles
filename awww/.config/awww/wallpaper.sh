#!/usr/bin/env bash
# Random wallpaper switcher for awww (formerly swww).
#   - no args : pick a random image from the wallpaper dir
#   - <path>  : set that specific image
# Used both on Hyprland autostart and via the Super+W keybind.

set -euo pipefail

WALL_DIR="${WALLPAPER_DIR:-$HOME/Pictures/wallpapers}"

# On autostart we may run before awww-daemon is ready — wait for it (≈4s max).
for _ in $(seq 1 20); do
	awww query >/dev/null 2>&1 && break
	sleep 0.2
done

# Choose the image: explicit arg if given, else random from the dir.
if [ "$#" -ge 1 ] && [ -f "$1" ]; then
	img="$1"
else
	img="$(find -L "$WALL_DIR" -type f \
		\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
		-o -iname '*.webp' -o -iname '*.gif' \) 2>/dev/null | shuf -n1)"
fi

if [ -z "${img:-}" ]; then
	notify-send "awww" "No wallpapers found in $WALL_DIR"
	exit 1
fi

# Grow from the cursor. hyprctl gives a top-left origin; awww expects
# bottom-left, hence --invert-y.
awww img "$img" \
	--transition-type grow \
	--transition-pos "$(hyprctl cursorpos | tr -d ' ')" \
	--invert-y \
	--transition-duration 1.5 \
	--transition-fps 60
