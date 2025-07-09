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
local player = {
    x = 100,
    y = 100,
    speed = 7,
    limit = 19,
    reduce = 3.5
}
function love.load()
    print("yo")
    sheet = love.graphics.newImage("sprite/player.png")
    Idle = love.graphics.newQuad(0, 0, 16, 16, sheet:getDimensions())
    
end

function love.update(dt)
 anyDown = love.keyboard.isDown( "a", "d", "s", 'a')
 if love.keyboard.isDown('d') then
  player.x = player.x + player.speed
 elseif love.keyboard.isDown('a') then
  player.x = player.x - player.speed
 elseif player.speed > player.limit then
  player.speed = player.reduce
 end
end

function love.draw()
    console.draw()
    opt.apply()
    love.graphics.draw(sheet, Idle, player.x, player.y, nil, 10, 10)
end