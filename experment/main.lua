-- plugins zone
love.graphics.setDefaultFilter("nearest", "nearest")

function love.conf(t)
    t.version = "0.9.2"
    t.console = true
end


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
	console.draw()
    opt.apply()
    love.graphics.draw(sheet, Idle, player.x, player.y, nil, 3, 3)
    print("yo")
    
end



