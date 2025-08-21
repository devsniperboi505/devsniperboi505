-- log.lua
local log = {
  entries = {},
  config = {
    x = 10,
    y = 10,
    lineHeight = 15,
    defaultColor = {1, 1, 1},
    maxEntries = 100,
    levelColors = {
      info = {1, 1, 1},
      debug = {0.6, 0.8, 1},
      warn = {1, 1, 0},
      error = {1, 0.3, 0.3}
    },
    enabledLevels = {
      info = true,
      debug = true,
      warn = true,
      error = true
    }
  }
}

function log.setConfig(options)
  for k, v in pairs(options) do
    if log.config[k] ~= nil then
      log.config[k] = v
    end
  end
end

function log.print(msg, level)
  level = level or "info"
  if not log.config.enabledLevels[level] then return end

  table.insert(log.entries, {
    text = "[" .. level:upper() .. "] " .. msg,
    color = log.config.levelColors[level] or log.config.defaultColor
  })

  if #log.entries > log.config.maxEntries then
    table.remove(log.entries, 1)
  end
end

function log.draw()
  for i, entry in ipairs(log.entries) do
    love.graphics.setColor(entry.color)
    love.graphics.print(entry.text, log.config.x, log.config.y + i * log.config.lineHeight)
  end
  love.graphics.setColor(1, 1, 1)
end

return log