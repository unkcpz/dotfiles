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

install `fish`

```
sudo pacman -S fish
```

TODO: fish need to be reconfig to be clean

install tmux

```
sudo pacman -S tmux
```

install atuin

```
sudo pacman -S atuin
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

- `swaybg` need `$HOME/.config/wallpaper/rick-and-morty-background.jpg`
- `xremap` for mapping win+hljk to arrow keys need `$HOME/.config/xremap.yml` 

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
git submodule add https://github.com/unkcpz/jyu.nvim nvim
```
