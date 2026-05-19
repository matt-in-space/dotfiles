# Matt's Dotfiles

Arch Linux + Hyprland (Wayland), Tokyo Night themed.

## Installation

Prerequisites: `stow`, plus the packages tracked in `pkglist.txt` / `aurlist.txt`.

```sh
git clone git@github.com:mattiebear/arch_dotfiles.git ~/dotfiles
cd ~/dotfiles

# 1. Install packages
sudo pacman -S --needed - < pkglist.txt
paru -S --needed - < aurlist.txt   # paru must already be installed

# 2. Symlink configs into ~/.config via GNU stow
stow alacritty awww fish hypr mako nvim screenshot starship waybar wofi zed
```

Stow links each package's `.config/<name>/` tree into `~/.config/`. Re-run
`stow -R <pkg>` after adding files inside a package.

## Packages

Two files at the repo root track every explicitly-installed package, so a
clean install can be rebuilt without remembering names:

| File          | Source            | Regenerate                       |
| ------------- | ----------------- | -------------------------------- |
| `pkglist.txt` | pacman repos      | `pacman -Qqen > pkglist.txt`     |
| `aurlist.txt` | AUR (via paru)    | `pacman -Qqem > aurlist.txt`     |

Refresh both whenever you install or remove something significant, then commit.

## Stow packages

| Package      | What it configures                                                  |
| ------------ | ------------------------------------------------------------------- |
| `alacritty`  | Terminal — Tokyo Night, Hack Nerd Font Mono, 0.9 opacity            |
| `awww`       | Wallpaper switcher (formerly `swww`) — random picker + transitions  |
| `fish`       | Shell config + `conf.d/` snippets (mise, starship)                  |
| `hypr`       | Hyprland (Lua), hyprlock, hypridle                                  |
| `mako`       | Notification daemon — Tokyo Night, urgency tiers, DND mode          |
| `nvim`       | Editor                                                              |
| `screenshot` | `grim`/`slurp`/`satty` wrapper script                               |
| `starship`   | Cross-shell prompt — Tokyo Night, Nerd Font icons                   |
| `waybar`     | Status bar — Tokyo Night, blurred via Hyprland layer rule           |
| `wofi`       | Application launcher — Tokyo Night                                  |
| `zed`        | Editor                                                              |

## Hyprland keybinds

Mod = `Super`. Defined in `hypr/.config/hypr/hyprland.lua`.

| Bind                  | Action                                              |
| --------------------- | --------------------------------------------------- |
| `Super + Q`           | Close window                                        |
| `Super + M`           | Exit Hyprland                                       |
| `Super + V`           | Toggle floating                                     |
| `Super + X`           | Terminal (alacritty)                                |
| `Super + B`           | Browser (firefox)                                   |
| `Super + F`           | File manager (yazi in alacritty)                    |
| `Super + Space`       | App launcher (wofi)                                 |
| `Super + W`           | Random wallpaper                                    |
| `Super + Escape`      | Lock session                                        |
| `Super + H/J/K/L`     | Focus window left/down/up/right                     |
| `Super + 0..9`        | Switch to workspace                                 |
| `Super + Shift + 0..9`| Move focused window to workspace                    |
| `Super + [` / `]`     | Cycle to prev/next workspace                        |
| `Super + LMB drag`    | Move window                                         |
| `Super + RMB drag`    | Resize window                                       |
| `Print`               | Region → clipboard                                  |
| `Shift + Print`       | Region → annotate in satty → file + clipboard       |
| `Super + Print`       | Active window → file + clipboard                    |
| `Ctrl + Print`        | Full screen → file + clipboard                      |

## Operational notes

- **swww → awww rename:** the wallpaper daemon was renamed upstream
  (Oct 2025). The Arch `extra` package is now `awww`; binaries are
  `awww` / `awww-daemon`. Stow package and configs all use the new name.
- **`pam_faillock`** locks the account after 3 wrong password attempts
  (`sudo`, `hyprlock`, login). Symptom: correct password also fails for
  ~10 min. Recover with `sudo faillock --user $USER --reset` from a TTY
  or root shell. Tally lives in `/run/faillock` (tmpfs — cleared on reboot).
- **`hyprctl` from a non-Hyprland shell** (e.g. inside `su -`) fails with
  `HYPRLAND_INSTANCE_SIGNATURE not set!`. Run it from a terminal inside
  the Hyprland session, or export the signature from `/run/user/1000/hypr/`.
