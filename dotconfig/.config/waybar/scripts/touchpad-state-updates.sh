#!/bin/bash

state_file=${XDG_RUNTIME_DIR}/touchpad-state
state="$(cat "${state_file}")"
echo "{\"text\": \"tp $state\", \"tooltip\": \"touchpad is $state, F11 to toggle\"}"
