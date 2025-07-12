-- main.lua
 -- Require the console script and assign it to a variable.
local console = require("loveconsole")

function love.draw()
	-- [Do main drawing operations before drawing the console.]
	love.graphics.pop() -- [Do this if you pushed any previous graphic translations.]
	console.draw()
end

function love.keypressed(key)
	-- [Handle key presses and then pass these on to the console.]
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

function love.keypressed(key)
	console.keypressed(key) -- Pass pressed keys to the console.
end

function love.textinput(t)
	console.textinput(t) -- Send text input to the console.
end

function love.resize(w, h)
	console.resize(w, h) -- Resize the console if the window is resized.
end

-- plugins zone
love.graphics.setDefaultFilter("nearest", "nearest")

function love.conf(t)
    t.version = "0.10.0"
    t.console = true
end

local console = require("loveconsole")
-- varible zone
local player = {
    x = 100,
    y = 100,
    velocity = 0,
    maxSpeed = 1100,
    boostPerPress = 350,
    friction = 5000
}

-- function code zone (you can code her)
function love.keypressed(key)
    console.keypressed(key)
    if key == "d" then
        isDHeld = true
        player.velocity = math.min(player.velocity + player.boostPerPress, player.maxSpeed)
    end
end

function love.textinput(t)
    console.textinput(t)
end

function love.resize(w, h)
    console.resize(w, h)
end

opt = require("settings")

local sheet
local Idle
local idle2


local isDHeld = false

function love.keyreleased(key)
    if key == "d" then isDHeld = false end
end

function love.load()
    print("yo")
    sheet = love.graphics.newImage("sprite/player.png")
    Idle = love.graphics.newQuad(0, 0, 16, 16, sheet:getDimensions())
end

function love.update(dt)
    if isDHeld == false then
        player.velocity = math.max(0, player.velocity - player.friction * dt)
    end

    player.x = player.x + player.velocity * dt
end

function love.draw()
    
    opt.apply()
    love.graphics.draw(sheet, Idle, player.x, player.y, nil, 3, 3)

    print("yo")
end


