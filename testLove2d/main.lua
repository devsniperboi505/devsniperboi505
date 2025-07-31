-- main.lua
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/loveconfig')
local opt = require('config/settings')
local console = require("loveconsole")
local player = require("object/player")

function love.load()
  player.load()
end
function love.update(dt)
  player.control(dt)
end
function love.draw()
	console.draw()
	player.draw()
end

function love.keypressed(key)
	console.keypressed(key)
end

function love.textinput(t)
	console.textinput(t)
end