-- settings.lua

local settings = {}

settings.potato_mode = true
settings.resolution_width = 800
settings.resolution_height = 600
settings.fullscreen_enabled = false
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
            fullscreen = settings.fullscreen_enabled
        })
        love.timer.step()
    else 
    	settings.msaa = 1
    	settings.resize = true
    end
end

return settings