#!/usr/bin/env bash
# Screenshot helper: grim + slurp + satty + wl-clipboard.
#
# Modes:
#   region-copy  region picker -> clipboard only          (Print)
#   region-edit  region picker -> satty annotator -> file (Shift+Print)
#   window       active window -> file + clipboard        (Super+Print)
#   full         entire output -> file + clipboard        (Ctrl+Print)

set -euo pipefail

DIR="${SCREENSHOT_DIR:-$HOME/Pictures/Screenshots}"
mkdir -p "$DIR"
FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

notify_saved() { notify-send "Screenshot" "Saved to $1"; }

case "${1:-full}" in
    region-copy)
        grim -g "$(slurp)" - | wl-copy --type image/png
        notify-send "Screenshot" "Region copied to clipboard"
        ;;
    region-edit)
        grim -g "$(slurp)" - | satty \
            --filename - \
            --output-filename "$FILE" \
            --early-exit \
            --copy-command 'wl-copy --type image/png'
        notify_saved "$FILE"
        ;;
    window)
        geom=$(hyprctl activewindow -j \
            | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$geom" "$FILE"
        wl-copy --type image/png < "$FILE"
        notify_saved "$FILE"
        ;;
    full)
        grim "$FILE"
        wl-copy --type image/png < "$FILE"
        notify_saved "$FILE"
        ;;
    *)
        echo "usage: $0 {region-copy|region-edit|window|full}" >&2
        exit 2
        ;;
esac
