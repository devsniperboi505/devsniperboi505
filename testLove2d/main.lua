-- main.lua
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/loveconfig')
local opt = require('config/settings')
local player = require("object/player")
log = require("plugin/mug")
piefiller = require("plugin/piefiller")
Pie = piefiller:new()
--[[
log.trace(...)
log.debug(...)
log.info(...)
log.warn(...)
log.error(...)
log.fatal(...)
]]

function love.load()
  player.load()
  log.info('welcome to game engine love2d lightweight framework lua game engine if you want this log sytle go to https://github.com/rxi/log.lua and download')
end
function love.update(dt)
  pie:attach()
  player.control(dt)
  pie:detach()
end
function love.draw()
  pie:attach()
  console.draw()
	player.draw()
	Pie:draw()
  pie:detach()
end

function love.keypressed(key)
 	Pie:keypressed(key)
end
function love.mousepressed(...)
 	Pie:mousepressed(...)
end