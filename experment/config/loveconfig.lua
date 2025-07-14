t1 = require("settings")
function love.conf(t)
	t.identity = nil
	t.version = "0.9.2"
	t.console = true
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
local um = {}
function um.draw()
    Love.conf(t)
end