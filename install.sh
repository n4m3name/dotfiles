#!/usr/bin/env bash
# install.sh — symlink this repo's dotfiles into $HOME.
# Usage:
#   ./install.sh              # interactive: prompt before replacing existing files
#   ./install.sh --force      # replace without prompting (backup goes to *.bak)
#   ./install.sh --deps       # also install Arch/AUR packages via pacman/yay
#   ./install.sh --dry-run    # show what would happen, change nothing

set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
FORCE=0
DEPS=0
DRY=0
for arg in "$@"; do
    case "$arg" in
        --force)   FORCE=1 ;;
        --deps)    DEPS=1 ;;
        --dry-run) DRY=1 ;;
        -h|--help)
            sed -n '2,8p' "$0"; exit 0 ;;
        *) echo "unknown arg: $arg" >&2; exit 1 ;;
    esac
done

say()  { printf '  %s\n' "$*"; }
run()  { if [[ $DRY -eq 1 ]]; then echo "+ $*"; else "$@"; fi; }

link() {
    local src="$1" dst="$2"
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        say "ok     $dst"
        return
    fi
    if [[ -e "$dst" || -L "$dst" ]]; then
        if [[ $DRY -eq 1 ]]; then
            say "would replace $dst"; return
        elif [[ $FORCE -eq 1 ]]; then
            run mv "$dst" "$dst.bak.$(date +%s)"
        else
            read -r -p "  replace $dst ? [y/N/q] " ans
            case "$ans" in
                y|Y) run mv "$dst" "$dst.bak.$(date +%s)" ;;
                q|Q) echo "aborting"; exit 1 ;;
                *)   say "skip   $dst"; return ;;
            esac
        fi
    fi
    run mkdir -p "$(dirname "$dst")"
    run ln -s "$src" "$dst"
    say "link   $dst"
}

echo "==> Linking dotfiles from $REPO into $HOME"

# Walk the repo and link every file that lives under a top-level dotdir/dotfile.
# We link files (not directories) so your future additions in $HOME/.config/foo/
# don't get clobbered.
cd "$REPO"
while IFS= read -r -d '' rel; do
    link "$REPO/$rel" "$HOME/$rel"
done < <(find .config .local .scripts .gtkrc-2.0 -type f -print0 2>/dev/null)

echo
echo "==> Making scripts executable"
for f in "$HOME/.local/bin/theme" "$HOME/.scripts/"*.sh "$HOME/.config/i3/"*.py; do
    [[ -e "$f" ]] && run chmod +x "$f"
done

if [[ $DEPS -eq 1 ]]; then
    echo
    echo "==> Installing packages"
    PAC=(i3-wm polybar picom kitty dunst conky cava neofetch rofi \
         pipewire pavucontrol bluez-utils blueman network-manager-applet \
         maim clipit batsignal hsetroot fzf light xss-lock i3lock dex \
         python-i3ipc)
    AUR=(mullvad-vpn-bin)
    if command -v pacman >/dev/null; then
        run sudo pacman -S --needed "${PAC[@]}"
    else
        echo "  skipped — pacman not found (not Arch?)"
    fi
    if command -v yay >/dev/null; then
        run yay -S --needed "${AUR[@]}"
    else
        echo "  AUR packages skipped — install yay first for: ${AUR[*]}"
    fi
fi

echo
echo "==> Fonts (install manually if missing)"
echo "    Tamzen, Cozette, JetBrainsMono Nerd Font, Source Code Pro, DejaVu Sans, Terminus"
echo
echo "==> VS Code theme (optional)"
echo "    code --install-extension amerey.blackplusplus"
echo
echo "Done. Log in to i3 and run \`theme dark\` to initialize."
