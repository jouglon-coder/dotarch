hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
    mirror = "eDP-1",
})

hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper & udiskie")
    hl.exec_cmd("bash ~/.config/hypr/scripts/terminal-en-on-focus.sh")
end)

require("conf.bind")
require("conf.input")
require("conf.look")
require("conf.windows")
