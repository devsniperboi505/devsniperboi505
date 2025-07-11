-- main.lua

love.graphics.setDefaultFilter("nearest", "nearest")

function love.conf(t) t.version = "0.9.2" t.console = false end

local console = require("loveconsole")

function love.keypressed(key) console.keypressed(key) if key == "d" then isDHeld = true player.velocityX = math.min(player.velocityX + player.boostPerPress, player.maxSpeed) end end

function love.textinput(t) console.textinput(t) end

function love.resize(w, h) console.resize(w, h) end

opt = require("settings")

local sheet local Idle

local player = { x = 100, y = 100, velocityX = 0, maxSpeed = 21, boostPerPress = 1, friction = 8 }

local isDHeld = false

function love.keyreleased(key) if key == "d" then isDHeld = false end end

function love.load() print("yo") sheet = love.graphics.newImage("sprite/player.png") Idle = love.graphics.newQuad(0, 0, 16, 16, sheet:getDimensions()) end

function love.update(dt) if isDHeld then -- No continuous acceleration, per keypress boost only else player.velocityX = math.max(0, player.velocityX - player.friction * dt) end

player.x = player.x + player.velocityX * dt

end

function love.draw() console.draw() opt.apply() love.graphics.draw(sheet, Idle, player.x, player.y, nil, 10, 10) love.graphics.print("Velocity: " .. string.format("%.2f", player.velocityX), 10, 10) end

