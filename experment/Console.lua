-- console.lua
local Console = {}
Console.__index = Console

local consoleInstance = nil -- internal instance reference

function Console:new(font)
    local obj = {
        messages = {},
        font = font or love.graphics.newFont(14),
        lineHeight = 18,
        maxMessages = 200,
        scrollOffset = 0,
        panelHeight = 200,
        touchStartY = nil,
        visible = false,
    }
    setmetatable(obj, Console)
    consoleInstance = obj -- store instance globally
    return obj
end

function Console:print(msg)
    table.insert(self.messages, os.date("%H:%M:%S") .. " > " .. tostring(msg))
    if #self.messages > self.maxMessages then
        table.remove(self.messages, 1)
    end
    self.scrollOffset = 0
end

function Console:draw()
    if not self.visible then return end

    love.graphics.setFont(self.font)
    local screenW, screenH = love.graphics.getDimensions()
    local panelY = screenH - self.panelHeight

    love.graphics.setColor(0, 0, 0, 0.75)
    love.graphics.rectangle("fill", 0, panelY, screenW, self.panelHeight)

    love.graphics.setColor(1, 1, 1, 1)
    local visibleLines = math.floor(self.panelHeight / self.lineHeight)
    local start = math.max(1, #self.messages - visibleLines - self.scrollOffset + 1)
    local y = panelY + 4
    for i = start, math.min(#self.messages, start + visibleLines - 1) do
        love.graphics.print(self.messages[i], 4, y)
        y = y + self.lineHeight
    end
end

function Console:update(dt)
    local visibleLines = math.floor(self.panelHeight / self.lineHeight)
    if self.scrollOffset > (#self.messages - visibleLines) then
        self.scrollOffset = 0
    end
end

function Console:touchpressed(x, y, id)
    self.touchStartY = y
end

function Console:touchreleased(x, y, id)
    if not self.touchStartY then return end
    local dy = y - self.touchStartY
    if math.abs(dy) > 20 then
        if dy > 0 then
            self.scrollOffset = math.max(0, self.scrollOffset - 1)
        else
            self.scrollOffset = self.scrollOffset + 1
        end
    end
    self.touchStartY = nil
end

function Console:keypressed(key)
    if key == "f9" then
        self.visible = not self.visible
    end
end

-- Hook global print to use consoleInstance
local old_print = print
function print(...)
    old_print(...)
    if consoleInstance and consoleInstance.print then
        local str = table.concat({...}, " ")
        consoleInstance:print(str)
    end
end

-- Define console global with log()
_G.console = {
    log = function(...)
        if consoleInstance and consoleInstance.print then
            local str = table.concat({...}, " ")
            consoleInstance:print(str)
        end
    end
}

return Console