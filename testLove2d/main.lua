-- load plugin zone
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/loveconfig')
local opt = require('config/settings')
local player = require("object/player")
  piefiller = require("plugin/piefiller")
pie = piefiller:new()
-- varible zone
local drawPIE = false  -- Moved this to the top level scope
-- function zone
function love.load()
  require("lovebird").update()
  lovebird.wrapprint = true
  print("yo")
  player.load()
end

function love.update(dt)
  require("lovebird").update()
  pie:attach()
  player.control(dt)
  pie:detach()
end

function love.draw()
  pie:attach()
  player.draw()
  pie:detach()
  if drawPIE then
    love.graphics.print(tostring(love.timer.getFPS( )), 1, 1, nil, 1.3, 1.3)
    pie:draw()  -- Added parentheses here
  end
  -- Removed the unnecessary return statement
end

function love.mousepressed(...)
  pie:mousepressed(...)
end

function love.keypressed(key)
  pie:keypressed(key)
  if key == "f9" then
    drawPIE = not drawPIE  -- Changed to toggle instead of just setting to true
  end
end
