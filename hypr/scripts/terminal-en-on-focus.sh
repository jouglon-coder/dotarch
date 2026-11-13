#!/usr/bin/env bash

sleep 2

publish_layout() {
    # Атомарный файл состояния для Firefox и будущих адаптеров приложений.
    local state="${XDG_RUNTIME_DIR:?}/hyprland-layout-caret"
    (umask 077; printf '%s\n' "$1" > "$state.$$") && mv -f -- "$state.$$" "$state"
}

set_cursor_en() {
    publish_layout en
    for sock in "${XDG_RUNTIME_DIR:?}/"kitty-layout-*; do
        [[ -S "$sock" ]] || continue
        kitty @ --to "unix:$sock" set-colors --all --configured cursor='#50fa7b'
    done
}

set_cursor_ru() {
    publish_layout ru
    for sock in "${XDG_RUNTIME_DIR:?}/"kitty-layout-*; do
        [[ -S "$sock" ]] || continue
        kitty @ --to "unix:$sock" set-colors --all --configured cursor='#ff5555'
    done
}

# Начальное состояние важно, если Firefox запускается до первого Caps Lock.
initial_layout=$(hyprctl -j devices | python3 -c '
import json, sys
keyboards = json.load(sys.stdin)["keyboards"]
print(next((k["active_keymap"] for k in keyboards if k.get("main")), ""))
')
case "$initial_layout" in
    *Russian*) set_cursor_ru ;;
    *English*) set_cursor_en ;;
esac

# activewindow приходит также при смене заголовка. Запоминаем адрес окна,
# чтобы включать EN только при настоящем переходе фокуса в Kitty.
last_window=$(hyprctl -j activewindow | python3 -c 'import json,sys; print(json.load(sys.stdin).get("address", ""))')
last_window="${last_window#0x}"

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
while read -r line; do

    # Переключились на kitty -> всегда EN
    if [[ "$line" == activewindowv2\>\>* ]]; then
        window="${line#activewindowv2>>}"
        window="${window#0x}"
        if [[ "$window" != "$last_window" ]]; then
            last_window="$window"
            window_class=$(hyprctl -j activewindow | python3 -c 'import json,sys; print(json.load(sys.stdin).get("class", ""))')
            if [[ "$window_class" == kitty ]]; then
                hyprctl switchxkblayout all 0
                set_cursor_en
            fi
        fi
    fi

    # Раскладка переключилась на RU
    if [[ "$line" == activelayout*Russian* ]]; then
        set_cursor_ru
    fi

    # Раскладка переключилась на EN
    if [[ "$line" == activelayout*English* ]]; then
        set_cursor_en
    fi

done
