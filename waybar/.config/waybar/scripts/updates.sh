#!/bin/sh
# Outputs JSON for the Waybar custom/updates module.
# Counts pending repo updates (checkupdates) + AUR updates (paru -Qua).

arch=$(checkupdates 2>/dev/null | wc -l)
aur=$(paru -Qua 2>/dev/null | wc -l)
total=$((arch + aur))

if [ "$total" -eq 0 ]; then
    printf '{"text":"","tooltip":"system up to date","class":"clean"}\n'
    exit 0
fi

pkgs=$( { checkupdates 2>/dev/null; paru -Qua 2>/dev/null; } \
    | head -20 \
    | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g' \
    | awk 'BEGIN{ORS="\\n"} {print}')

printf '{"text":"%d","tooltip":"%d repo, %d AUR\\n\\n%s","class":"has-updates"}\n' \
    "$total" "$arch" "$aur" "$pkgs"
