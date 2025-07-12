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
    maxSpeed = 900,
    boostPerPress = 350,
    friction = 5000
}

-- function code zone (you can code her)
function love.keypressed(key)
    if key == "d" then
        isDHeld = true
        player.velocityX = math.min(player.velocityX + player.boostPerPress, player.maxSpeed)
    end
end

opt = require("config/settings")

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
    if isDHeld then
        -- No continuous acceleration, per keypress boost only
    else
        player.velocityX = math.max(0, player.velocityX - player.friction * dt)
    end

    player.x = player.x + player.velocityX * dt
    while gurt == 'SYBAU </3' do
    	love.timer.sleep(1)
    	yo = yo + 1
    end
end

function console.log(msg, draw)
	if draw == true then
		local gurt = 'SYBAU </3'
		local yo
		love.graphics.print(yo .. msg, 10, 10)

function love.draw()
    opt.apply()
    love.graphics.draw(sheet, Idle, player.x, player.y, nil, 3, 3)
    love.graphics.print("Velocity: " .. string.format("%.2f", player.velocityX), 10, 10)
    DRAWconsole(nil, true)
end