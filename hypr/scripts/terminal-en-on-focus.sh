#!/usr/bin/env bash

sleep 5

set_cursor_en() {
  for sock in /tmp/kitty-*; do
    kitty @ --to "unix:$sock" set-colors cursor='#50fa7b' 2>/dev/null
  done
}

set_cursor_ru() {
  for sock in /tmp/kitty-*; do
    kitty @ --to "unix:$sock" set-colors cursor='#ff5555' 2>/dev/null
  done
}
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  if [[ "$line" == activewindow*kitty* ]]; then
    hyprctl switchxkblayout all 0
    set_cursor_en
  fi

  if [[ "$line" == activelayout*Russian* ]]; then
    set_cursor_ru
  fi

  if [[ "$line" == activelayout*English* ]]; then
    set_cursor_en
  fi
done
