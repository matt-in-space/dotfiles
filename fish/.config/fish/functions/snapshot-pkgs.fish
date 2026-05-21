function snapshot-pkgs --description 'Regenerate pkglist.txt and aurlist.txt from currently installed packages'
    set -l dotfiles $HOME/dotfiles
    if not test -d $dotfiles
        echo "snapshot-pkgs: $dotfiles does not exist" >&2
        return 1
    end

    pacman -Qqen >$dotfiles/pkglist.txt
    pacman -Qqem >$dotfiles/aurlist.txt

    set -l native (count < $dotfiles/pkglist.txt)
    set -l aur (count < $dotfiles/aurlist.txt)
    echo "Wrote $native native -> $dotfiles/pkglist.txt"
    echo "Wrote $aur AUR    -> $dotfiles/aurlist.txt"
end
