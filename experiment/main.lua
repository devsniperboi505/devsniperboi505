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
    if button.xpressed then
     print("SYBAU </3")
    end
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