#!/bin/bash

state_file=${XDG_RUNTIME_DIR}/sway_keyboard_layout
layout="$(cat "${state_file}")"

echo "{\"text\": \"$layout\", \"tooltip\": \"$layout in use, Mod + space to toggle\"}"
