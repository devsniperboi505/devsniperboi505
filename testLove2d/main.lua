-- load plugin zone
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/settingLITE')
local t = require('config/t1')
local opt = require('config/settingLITE')
local player = require("object/player")
  piefiller = require("plugin/piefiller")
local log = require("plugin/lovedebug")
pie = piefiller:new()
-- varible zone
local drawPIE = false  -- Moved this to the top level scope
-- function zone

function love.load()
  t.enableplugin(love.graphics.getWidth(), love.graphics.getHeight())
  t.draw()
  print("yo")
  player.load()
end

function love.update(dt)
  t.enableplugin()
  pie:attach()
  player.control(dt)
  pie:detach()
end

function love.resize(w, h)
  t.resize(w, h)
end

function love.draw()
  log.draw()
  t.start()
  pie:attach()
  player.draw()
  pie:detach()
  if drawPIE then
    love.graphics.print(tostring(love.timer.getFPS( )), 1, 1, nil, 1.3, 1.3)
    pie:draw()  
  end
  t.ends()
end

function love.mousepressed(...)
  pie:mousepressed(...)
end

function love.keypressed(key)
  Key = "f9"
  log.key(key)
  if key == "f9" then
    drawPIE = not drawPIE  -- Changed to toggle instead of just setting to true
    pie:keypressed(key)
  end
end