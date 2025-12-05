## TODO

- [ ] snapper for snapshot
- [ ] backup, how?

## how to use

to sync run:

```
stow .
```

to unlink all

```
stow -D .
```

### fish, tmux, atuin

install `fish`, depend on having:

- cargo (from rust)
- atuin
- uv
- starship (from its website)
- zoxide (`cargo install zoxide`)
- npm
- eza (`cargo install eza`)

```
sudo pacman -S uv atuin starship zoxide eza bat
```

```
sudo pacman -S fish
```

! run `stow fish` to symlink, because stow exclude fish from `.config`

install tmux

```
sudo pacman -S tmux
```

need `tmux-mem-cpu-load` to show bar, install it from aur.

### sway

- `sway`, `swaylock`, `swayidle`, `swaybg`
- `waybar`, `wlsunset`, `network-manager-applet`, `mako`, `xremap`
- `kitty`, `firefox`
- `wofi`, `slurp`, `grim`
- aur: wdisplay

```
sudo pacman -S sway swaylock swayidle swaybg waybar wlsunset network-manager-applet mako kitty firefox wofi slurp grim
```

```
yay -S wdisplays xremap
# xremap-wlroots
```

- `xremap` for mapping win+hljk to arrow keys need `$HOME/.config/xremap.yml` 
- xremap need `sudo usermod -aG input $USER`
- and xremap need: https://github.com/xremap/xremap?tab=readme-ov-file#arch-linux-1 to be in the uinput (make sure go through every steps)
- enable mako service: `systemctl --user status mako`, can test by `notify-send "Mako Test" "If you see this, mako is working"`

### neovim

need `neovim` for sure.
and tools for lsp etc.
- julia
- rust
- lua
- ripgrep
- stylua
- fd
- lazygit
- rust-analyzer
- ?? denols

to copy to clipboard since I use wayland, need `wl-clipboard`

```
sudo pacman -S neovim julia rust lua ripgrep stylua fd lazygit rust-analyzer
sudo pacman -S wl-clipboard
```

Since I use mason, I need `unzip`, `npm`, `gem`, `wget`, `luarocks`

I have my neovim config maintain as a separated repo, put here as a submodule.

```
git submodule add https://github.com/unkcpz/dotnvim nvim
```

## fonts

- `noto-fonts-emoji`
- and `sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-extra`
- and `tff-hack` for hack-nerd-font in waybar
- more important `sudo pacman -S ttf-hack-nerd`

## audio and screen sharing on sway

- `pipewire` and `wireplumber`, `pwvucontrol`
using sway, I need `xdg-desktop-portal-wlr` the desktop portal backend for wlroots.
- too make x-org based app (zoom for example) working, need `xorg-xwayland`

## backlight control

- use `brightnessctl` which is the only tool not from aur
- requires your user to be in the video and input groups. (done by default)

## thinkpad fan control and power saving using tlp

use `thinkfan` from aur and have `/etc/thinkfan.conf`

```
sensors:
  - tpacpi: /proc/acpi/ibm/thermal
    indices: [0]

fans:
  - tpacpi: /proc/acpi/ibm/fan

levels:
  - [0, 0, 50]
  - ["level auto", 45, 75]
  - ["level disengaged", 70, 255]
```

```
sudo pacman -S tlp tlp-rdw
```

## packages from nix

I have `packages.nix` to maintain a list of packages comes from nix store.
Then runs: `nix-env -f packages.nix -i`

## vconsole color

```
[Unit]
Description=Set VT RGB colors
After=local-fs.target

[Service]
Type=oneshot
ExecStart=/usr/bin/setvtrgb /etc/vtrgb
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

with 

`/etc/vtrgb` as

```
12,46,81,115,149,183,218,252,227,230,220,49,128,49,117,177
13,47,82,116,150,184,219,253,26,85,160,163,177,130,107,89
14,48,83,117,151,185,220,254,28,13,96,84,211,189,177,40
```
