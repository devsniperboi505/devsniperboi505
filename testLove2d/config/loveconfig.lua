local loveconfig = {}
t1 = require("config/t1")
t2 = require("config/settingLITE.lua")
function loveconfig.draw(t)
	t.identity = t2.identity
	t.version = t2.version
	t.console = t2.console
	t.accelerometerjoystick = t2.accelerometerjoystick
	t.gammacorrect = t2.gammacorrect

	t.window.title = t2.title
	t.window.icon = t2.icon
	t.window.width = t2.width
	t.window.height = t2.height
	t.window.borderless = t2.borderless
	t.window.resizable = t2.resize
	t.window.minwidth = t2.minwidth
	t.window.minheight = t2.minwidth
	t.window.vsync = t2.vsync
	t.window.msaa = t2.msaa
	t.window.display = t2.display
	t.window.highdpi = t2.highdpi
	t.window.x = t2.windowX
	t.window.y = t2.windowY
end

return loveconfig