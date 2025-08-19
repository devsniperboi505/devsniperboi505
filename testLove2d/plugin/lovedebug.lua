-- logdev.lua
local logdev = {}

-- Configuration
logdev.font = love.graphics.newFont(14)
logdev.visible = false
logdev.maxLogs = math.floor(love.graphics.getHeight() / logdev.font:getHeight()) - 1
logdev.logs = {}
logdev.yeezus = 0

-- Colors for different log levels
logdev.colors = {
    debug   = {0.6, 0.6, 0.6}, -- gray
    warning = {1.0, 0.8, 0.0}, -- yellow
    error   = {1.0, 0.2, 0.2}, -- red
    normal  = {1.0, 1.0, 1.0}, -- white
}

-- Add message to log
function logdev.print(msg, level)
    logdev.yeezus = logdev.yeezus + 1
    level = level or "normal"
    table.insert(logdev.logs, {text = tostring(msg), level = level})

    -- If logs exceed screen capacity, remove oldest
    if #logdev.logs > logdev.maxLogs then
        table.remove(logdev.logs, 1)
    end
end

-- Toggle visibility with a key
function logdev.key(key)
    if key == "f9" then -- F3 like Minecraft debug
        logdev.visible = not logdev.visible
    end
end

-- Draw logs
function logdev.draw()
    love.graphics.setFont(logdev.font)

    local y = 10
    for _, log in ipairs(logdev.logs) do
        local color = logdev.colors[log.level] or logdev.colors.normal
        love.graphics.setColor(color)
        love.graphics.print(log.text, 10, y)
        y = y + logdev.font:getHeight()
    end

    -- reset color
    love.graphics.setColor(1, 1, 1)
end

return logdev