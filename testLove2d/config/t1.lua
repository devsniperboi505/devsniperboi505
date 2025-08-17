-- settings.lua
local settings = {}
local t = require("config/settingLITE")

settings.potato_mode = t.fullscreen
settings.resolution = {800, 600} -- Virtual resolution
settings.fullscreen = t.fullscreen
settings.vsync = t.vsync
settings.msaa = t.msaa
settings.resize = t.resize

function settings.enableplugin(w1, h1)
  require("config/push")
  local windowWidth = w1
  local windowHeight = h1
  return w1, h1
end

function settings.draw()
  if settings.potato_mode then
    t.fullscreen = true
    t.resize = false
  else
    t.msaa = 1
    t.resize = true
  end
  push:setupScreen(t.resolution[1], t.resolution[1], windowWidth, windowHeight, {fullscreen = t.fullscreen, resizable = t.resize, })
end

function settings.resize(w, h)
  push:resize(w, h)
end

function settings.start()
  push:start()
end

function settings.ends()
  push:finish()
end

return settings