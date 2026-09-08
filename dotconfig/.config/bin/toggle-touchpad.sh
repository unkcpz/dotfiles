#!/usr/bin/env bash

state_file=${XDG_RUNTIME_DIR}/touchpad-state

if [ -f ${state_file} ] && [ "$(cat "${state_file}")" = "enabled" ]; then
    swaymsg 'input type:touchpad events disabled'
    echo "disabled" > ${state_file}
else
    swaymsg 'input type:touchpad events enabled'
    echo "enabled" > ${state_file}
fi
