love.graphics.setDefaultFilter("nearest", "nearest")
--                 love gmae configure
function love.conf(t)
 t.version = "0.9.2"
 t.console = false
end
 --             function configuration zone.
local console = require("loveconsole")

function love.keypressed(key)
	console.keypressed(key)
	
end

function love.textinput(t)
	-- [Receive text input and pass it on to the console.]
	console.textinput(t)
end

function love.resize(w, h)
	-- [Resize the console if the window is resized.]
	console.resize(w, h)
end
function love.load()
	--This is one way of making a button. You can make it however you want, even use pre-made libraries
	myButton = {
		x = 10, y = 10, image = love.graphics.newImage("myButton.png"), clicked = false
	}
	
	--This is just an easy way to know the pop-up image and where to draw it. Change to whatever you want
	myImage = {
		x = 0, y = 16, image = love.graphics.newImage("player.png")
	}
end

function love.draw()
	love.graphics.draw(myButton.image, myButton.x, myButton.y) --This is where we draw your button
	
	if myButton.clicked then --If the person clicked the button, this will be true
		love.graphics.draw(myImage.image, myImage.x, myImage.y) --This is where we draw the pop-up image
	end
end

function love.mousepressed(x, y, button)
	if button == 1 then --Left click
		if x >= button.x and x <= button.x+button.image:getWidth() and y >= button.y and y <= button.y+button.image:getHeight() then --Detect if the click was inside the button
			button.clicked = true --This is what triggers the pop-up image
		end
	end
end
--                 start her to code
opt = require("settings")
local sheet
local Idle

local playerx = 100
local playery = 100
local playerXspeed = 4
local playerYjump = 5

function love.load()
    print("yo")
    sheet = love.graphics.newImage("sprite/player.png")
    Idle = love.graphics.newQuad(0, 0, 16, 16, sheet:getDimensions())
    
end

function love.update(dt)
 if love.keyboard.isDown('d') then
  playerx = playerx + playerXspeed
 elseif love.keyboard.isDown('a') then
  playerx = playerx - playerXspeed
 end
end

function love.draw()
    console.draw()
    opt.apply()
    love.graphics.draw(sheet, Idle, playerx, playery, nil, 10, 10)
end