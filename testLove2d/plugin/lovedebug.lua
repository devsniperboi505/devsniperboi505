-- log.lua
log = {}
log.messages = {}
log.visible = false
log.maxLines = 0
log.fontHeight = 14

function log.print(msg)
  table.insert(log.messages, msg)
  if #log.messages > log.maxLines then
    table.remove(log.messages, 1) -- remove oldest
  end
end

function log.toggle()
  log.visible = not log.visible
end

function log.draw()
  if not log.visible then return end
  love.graphics.setColor(255, 255, 255)
  for i, msg in ipairs(log.messages) do
    love.graphics.print(msg, 10, i * log.fontHeight)
  end
end

function log.updateScreenLimit()
  local screenHeight = love.graphics.getHeight()
  log.maxLines = math.floor(screenHeight / log.fontHeight)
end

return log