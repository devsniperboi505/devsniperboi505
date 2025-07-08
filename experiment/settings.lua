-- settings.lua

local settings = {}

settings.potato_mode = false
settings.resolution_width = 800
settings.resolution_height = 600
settings.fullscreen_enabled = false
settings.vsync = false

function settings.apply()
    -- Nearest neighbor for pixel sprites
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Detect OpenGL version (fallback method for 0.9.2)
    local _, version = love.graphics.getRendererInfo()
    print("Renderer Version:", version)

    -- Extract version number from string
    local major, minor = version:match("OpenGL (%d)%.(%d)")
    major = tonumber(major)
    minor = tonumber(minor)

    -- Apply potato mode settings
    if settings.potato_mode then
        settings.resolution_width = 800
        settings.resolution_height = 600
        love.window.setMode(settings.resolution_width, settings.resolution_height, {
            fullscreen = settings.fullscreen_enabled,
            vsync = false
        })
        love.timer.step()
    end
end

return settings