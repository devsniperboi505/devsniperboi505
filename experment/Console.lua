-- console.lua
local Console = {}

function Console:new(font)
    local obj = {
        messages = {},
        font = font or love.graphics.newFont(14),
        lineHeight = 18,
        maxMessages = 200,
        scrollOffset = 0,
        panelHeight = 200,
        touchStartY = nil,
    }
    setmetatable(obj, Console)
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

-- Hook global print to use console.print
local old_print = print
function print(...)
    old_print(...)
    if _G.console and _G.console.print then
        local str = table.concat({...}, " ")
        _G.console:print(str)
    end
end

return Console
