# dotfiles

A ThinkPad-oriented, red-on-black, minimal i3 setup for Arch Linux. Dark/light toggle that re-skins the whole desktop from one command. No DE, no GTK bloat — just i3 + polybar + picom + kitty, plus a handful of helper scripts.

## Install

```bash
git clone https://github.com/<you>/dotfiles ~/Documents/projects/dotfiles
cd ~/Documents/projects/dotfiles
./install.sh              # symlinks files into $HOME, prompts before replacing
./install.sh --deps       # also installs pacman/AUR packages
./install.sh --force      # replace existing files without prompting (backups → *.bak.<ts>)
./install.sh --dry-run    # preview, change nothing
```

Everything gets symlinked, so edits to files in this repo are live immediately. Anything it would overwrite gets moved to `*.bak.<timestamp>`.

## The `theme` switcher

`~/.local/bin/theme` flips the whole desktop between dark and light in one shot:

```
theme dark      # switch to dark
theme light     # switch to light
theme toggle    # flip
theme status    # print current
```

It re-skins kitty, i3, polybar, neofetch, VS Code, and Firefox (via a `prefers-color-scheme` override), swaps ANSI palettes, and on supported ThinkPads turns the keyboard backlight off in light mode.

Theme pairs live in `.config/themes/{i3,polybar,kitty}/{dark,light}.*`. The active mode is a symlink from `theme.conf`/`theme.ini` to whichever one is current, plus a `current` state file.

## What's in here

| Tool       | File                                        |
| ---------- | ------------------------------------------- |
| i3         | `.config/i3/config`                         |
| polybar    | `.config/polybar/config.ini`                |
| picom      | `.config/picom/picom.conf`                  |
| kitty      | `.config/kitty/kitty.conf`                  |
| dunst      | `.config/dunst/dunstrc`                     |
| conky      | `.config/conky/conky.conf`                  |
| cava       | `.config/cava/config`                       |
| neofetch   | `.config/neofetch/config`                   |
| GTK 2/3    | `.gtkrc-2.0`, `.config/gtk-3.0/settings.ini`|
| Nvim       | `.config/nvim/colors/blackred.lua` (colorscheme only — drop-in for any neovim) |
| VS Code    | `.config/Code/User/settings.json` (font + `[Black++ Theme]` red overrides) |
| Themes     | `.config/themes/`                           |
| Switcher   | `.local/bin/theme`                          |
| Polybar    | `.scripts/{wifi,vpn,bt}-status.sh`          |
| scripts    |                                             |

## Dependencies

Core: `i3-wm`, `polybar`, `picom`, `kitty`, `dunst`, `conky`, `cava`, `neofetch`, `rofi`, `pipewire`, `pavucontrol`, `bluez-utils`, `blueman`, `network-manager-applet`, `maim`, `clipit`, `batsignal`, `hsetroot`, `fzf`, `light`, `xss-lock`, `i3lock`, `dex`. AUR: `mullvad-vpn-bin`. Run `./install.sh --deps` to install all of the above.

Fonts (install manually): Tamzen, Cozette, JetBrainsMono Nerd Font, Source Code Pro, DejaVu Sans, Terminus.

VS Code dark theme (optional, Marketplace extension):

```bash
code --install-extension amerey.blackplusplus
```

Light mode uses the built-in "Default High Contrast Light" — no install.

## What you may want to tweak

- **Firefox profile** — `theme` auto-detects `*.default-release`. If yours has a different name, export `FF_PROFILE=/path/to/profile` before running.
- **VS Code themes** — `.local/bin/theme` sets the theme names `Default High Contrast Light` (light) and `Black++ Theme` (dark). Edit `apply_vscode` in the script to use others.
- **Polybar wifi interface** — `wifi-status.sh` auto-detects the first `wl*` interface. If you have multiple, hardcode the one you want.
- **Keyboard backlight** — only works on ThinkPads with `/sys/class/leds/tpacpi::kbd_backlight/`. The switcher silently skips it otherwise.

## License

MIT — do what you want.
