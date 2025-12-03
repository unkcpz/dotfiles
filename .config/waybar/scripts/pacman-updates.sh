#!/bin/bash
count=$(pacman -Qu | wc -l)
echo "{\"text\": \"󰏗 $count\", \"tooltip\": \"$count updates available\"}"
