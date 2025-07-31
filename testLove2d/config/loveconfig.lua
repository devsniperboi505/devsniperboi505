local loveconfig = {}
t1 = require("config/settings")
function loveconfig.draw(t)
	t.identity = nil
	t.version = "0.10.0"
	t.console = false
	t.accelerometerjoystick = true
	t.gammacorrect = false

	t.window.title = "iceness platform: prototype 0.0.01"
	t.window.icon = nil
	t.window.width = 800
	t.window.height = 600
	t.window.borderless = false
	t.window.resizable = t1.resize
	t.window.minwidth = 640
	t.window.minheight = 480
	t.window.vsync = t1.vsync
	t.window.msaa = t1.msaa
	t.window.display = 1
	t.window.highdpi = false
	t.window.x = nil
	t.window.y = nil
end

return loveconfig