## TODOs

- [ ] F1-F12 control
- [ ] xbacklight control
- [ ] power save, lower fan speed etc.
- [ ] neovim, fzf search can on hidden files. but not `.git`
- [ ] sway keybinding to restart sway and the waybar.
- [ ] the accurate font settings.


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
