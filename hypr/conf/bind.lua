-- Variables
local mainMod  = "SUPER"
local menu     = "wofi --show drun"
local volRaise = "XF86AudioRaiseVolume"
local volLower = "XF86AudioLowerVolume"
local briUp    = "XF86MonBrightnessUp"
local briDown  = "XF86MonBrightnessdown"

-- Main
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprlauncher"))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Movement
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Apps
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + T", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd("pkill -f Telegram"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('hyprshot -m region --clipboard-only -s; notify-send -i ~/Pictures/mako/shrek1.jpg "Щёлк!" "Нормальный кадр"'))

-- System
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("poweroff"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd('nmcli connection up "iPhone" && notify-send -i ~/Pictures/mako/iphone.jpg "Wi-Fi" "hey apple"'))

-- Volume
hl.bind(volRaise, hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind(volLower, hl.dsp.exec_cmd("wpctl set-volume      @DEFAULT_AUDIO_SINK@ 5%-"))

-- Brightness
hl.bind(briUp, hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind(briDown, hl.dsp.exec_cmd("brightnessctl set 5%-"))
