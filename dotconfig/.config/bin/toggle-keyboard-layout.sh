#!/usr/bin/env bash

state_file=${XDG_RUNTIME_DIR}/sway_keyboard_layout

if [ -f ${state_file} ] && [ "$(cat "${state_file}")" = "dvorak" ]; then
    swaymsg 'input type:keyboard xkb_layout us'
    swaymsg 'input type:keyboard xkb_variant ""'
    swaymsg 'input type:keyboard xkb_options "eurosign:e"'
    echo qwerty > ${state_file}
else
    swaymsg 'input type:keyboard xkb_layout us'
    swaymsg 'input type:keyboard xkb_variant "dvorak-alt-intl"'
    swaymsg 'input type:keyboard xkb_options "eurosign:e,ctrl:swapcaps"'
    echo dvorak > ${state_file}
fi
