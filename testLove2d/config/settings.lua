-- settings.lua

local settings = {}

settings.potato_mode = true
settings.resolution = {800, 600}
settings.resolution_width = settings.resolution[1]
settings.resolution_height = settings.resolution[2]
settings.fullscreen = false
settings.vsync = false
settings.msaa = 0
settings.resize = false
function settings.apply()
    -- Apply potato mode settings
    if settings.potato_mode then
    	settings.vsync = false
        settings.resolution_width = 800
        settings.resolution_height = 600
        love.window.setMode(settings.resolution_width, settings.resolution_height, {
            fullscreen = settings.fullscreen
        })
        love.timer.step()
    else 
    	settings.msaa = 1
    	settings.resize = true
    end
end

return settings