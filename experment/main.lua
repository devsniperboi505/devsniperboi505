-- plugins zone
love.graphics.setDefaultFilter("nearest", "nearest")
local console_toggle = require("console/console")
local bump = require("bump")

opt = require("config/settings")

-- varible zone
local world
local player = {}

local sheet
local Idle
local isJumping = false
local vy = 0
local gravity = 800
local jumpForce = -350
local moveSpeed = 250

function love.load()
    print("yo")

    -- bump world (grid size 16)
    world = bump.newWorld(16)

    -- player sprite sheet
    sheet = love.graphics.newImage("sprite/player.png")
    Idle = love.graphics.newQuad(0, 0, 16, 16, sheet:getDimensions())

    -- player init
    player.x = 100
    player.y = 100
    player.w = 16 * 3
    player.h = 16 * 3

    world:add(player, player.x, player.y, player.w, player.h)

    -- ground
    ground = {x = 0, y = 400, w = 800, h = 50}
    world:add(ground, ground.x, ground.y, ground.w, ground.h)
end

function love.update(dt)
    local dx = 0

    -- left/right movement
    if love.keyboard.isDown("a", "left") then
        dx = dx - moveSpeed * dt
    end
    if love.keyboard.isDown("d", "right") then
        dx = dx + moveSpeed * dt
    end

    -- gravity
    vy = vy + gravity * dt

    -- jump if grounded
    if love.keyboard.isDown("w", "up", "space") and not isJumping then
        vy = jumpForce
        isJumping = true
    end

    -- bump movement
    local goalX = player.x + dx
    local goalY = player.y + vy * dt

    local actualX, actualY, cols, len = world:move(player, goalX, goalY)

    player.x = actualX
    player.y = actualY

    -- detect ground
    isJumping = true
    for i = 1, len do
        if cols[i].normal.y < 0 then
            vy = 0
            isJumping = false
        end
    end
end

function love.draw()
    opt.apply()

    -- draw player with sprite sheet quad
    love.graphics.draw(sheet, Idle, player.x, player.y, 0, 3, 3)

    -- debug velocity
    love.graphics.print("Vertical Velocity: " .. string.format("%.2f", vy), 10, 10)

    -- draw ground
    love.graphics.setColor(1, 1, 1, 0.2)
    love.graphics.rectangle("fill", ground.x, ground.y, ground.w, ground.h)
    love.graphics.setColor(1, 1, 1, 1)
end