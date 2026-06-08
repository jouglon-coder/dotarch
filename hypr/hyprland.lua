local function get_hostname()
    local file = io.open("/etc/hostname", "r")
    if file == nil then
        return "unknown"
    end

    local result = file:read("*l")
    file:close()
    
    return result or "unknown"
end

local hostname = get_hostname()

if hostname == "arch-hyprland" then
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
elseif hostname == "cachy" then
    hl.monitor({
    	output = "DP-2",
    	mode = "3440x1440@144",
    	position = "0x0",
    	scale = "1",
    })
else
    hl.monitor({
    	output = "",
    	mode = "preferred",
    	position = "auto",
    	scale = "1",
    })
end

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper & udiskie")
    hl.exec_cmd("bash ~/.config/hypr/scripts/terminal-en-on-focus.sh")
end)

require("conf.bind")
require("conf.input")
require("conf.look")
require("conf.windows")
