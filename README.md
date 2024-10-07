# Dotfiles

## Info prerequisites

### Tuxedo laptop (infinity Gen 15 Pro)

- Keyboard layout generic 105 keys with Dvorak layout.
- xubuntu installed from WebFAI without partition.

## Setups for  a new machine

### Keyboard layout

Using Dvorak, alt. intl. with r-ctrl as compose key, swap l-ctrl and Caps Lock. 
I also swap l-alt and win-key so the ModKey4 which is win key is more ergonomic for my left thumb.

```
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbModel" "pc105"                 # Keyboard model
    Option "XkbLayout" "us"                   # Keyboard layout
    Option "XkbVariant" "dvorak-alt-intl"     # Keyboard variant
    Option "XkbOptions" "ctrl:swapcaps,compose:rctrl,altwin:swap_lalt_lwin"
EndSection
```

### DM & WM

- [ ] awesome setup
- [ ] need first picom setup to enable opacity

### tmux

- [ ] tmux copy to clipboard

### atuin

### Mail client

Using BetterBird to replace ThunderBird.

### Terminal emulator (`alacritty`)

Using [`alacritty`](https://github.com/alacritty/alacritty) as the terminal emulator.
For the Post Build operations, need to clone the repo and run commands to make them work.

### Misc make life smooth

#### Touchpad sensitivity 

Install and use libinput as driver and turn on the palm detection.

```
# /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"

    # Enable tap-to-click
    Option "Tapping" "on"

    # Enable natural scrolling (reverse scroll direction)
    Option "NaturalScrolling" "true"

    # Disable touchpad while typing
    Option "DisableWhileTyping" "true"

    # Enable palm detection to prevent accidental touches
    Option "PalmDetection" "true"

    # Adjust palm detection sensitivity (values may need fine-tuning)
    Option "PalmMinWidth" "8"        # Width of palm to detect
    Option "PalmMinPressure" "200"   # Pressure threshold for palm detection

    # Enable horizontal two-finger scrolling
    Option "HorizontalScrolling" "true"

    # Adjust sensitivity and speed
    Option "AccelProfile" "adaptive"
    Option "AccelSpeed" "0.3"        # Adjust speed, 0.0 for normal, -1.0 for slow, 1.0 for fast

    # Enable middle-click with three fingers
    Option "ClickMethod" "clickfinger"

    # Optional: Configure left-handed mode (set to "true" for left-handed)
    # Option "LeftHanded" "true"
EndSection
```

### Neovim

The setup and instruction goes to https://github.com/unkcpz/jyu.nvim as submodule (TODO).

