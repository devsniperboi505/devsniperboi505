-- main.lua
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/loveconfig')
local opt = require('config/settings')
local player = require("object/player")
log = require "log"
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
  log.info('welcome to game engine love2d lightif you want this log sytle go to https://github.com/rxi/log.lua and download')
end
function love.update(dt)
  player.control(dt)
end
function love.draw()
	console.draw()
	player.draw()
end
