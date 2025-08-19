log = {}
function log.print(msg)
  table.insert(log, msg)
end

function log.draw()
  for i, msg in ipairs(log) do
    love.graphics.print(msg, 10, i * 15)
  end
end

return log