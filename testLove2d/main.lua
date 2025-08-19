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
	--This is one way of making a button. You can make it however you want, even use pre-made libraries
	myButton = {
		x = 10, y = 10, image = love.graphics.newImage("myButton.png"), clicked = false
	}
end

function love.draw()
  love.graphics.draw(myButton.image, myButton.x, myButton.y) --This is where we draw your button
	
  if myButton.clicked then --If the person clicked the button, this will be true
    print("hi")
  end
end

function love.mousepressed(x, y, button)
	if button == 1 then --Left click
		if x >= button.x and x <= button.x+button.image:getWidth() and y >= button.y and y <= button.y+button.image:getHeight() then --Detect if the click was inside the button
			button.clicked = true --This is what triggers the pop-up image
		end
	end
end

function love.load()
  love.keypressed("f9")
  t.enableplugin(love.graphics.getWidth(), love.graphics.getHeight())
  t.draw()
  print("yo")
  player.load()
end

function love.update(dt)
  pie:attach()
  player.control(dt)
  pie:detach()
end

function love.resize(w, h)
  t.resize(w, h)
end

function love.draw()
  t.start()
  pie:attach()
  player.draw()
  pie:detach()
  if drawPIE then
    love.graphics.print(tostring(love.timer.getFPS( )), 1, 1, nil, 1.3, 1.3)
    log.draw()
    pie:draw()
  end
  t.ends()
end

function love.mousepressed(...)
  pie:mousepressed(...)
end

function love.keypressed(key)
  if key == "f9" then
    drawPIE = not drawPIE  -- Changed to toggle instead of just setting to true
    pie:keypressed(key)
  end
end

function print(msg)
  log.print(msg)
end