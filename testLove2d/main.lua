-- main.lua

local pieChartVisible = false  -- Initially, the pie chart is hidden
love.graphics.setDefaultFilter("nearest", "nearest") -- make sure add this for blur the pixel to unblur
local bump = require('plugin/bump')
local loveconfig = require('config/loveconfig')
local opt = require('config/settings')
local player = require("object/player")
log = require("plugin/mug")
piefiller = require("plugin/piefiller")
pie = piefiller:new()
--[[
log.trace(...)
log.debug(...)
log.info(...)
log.warn(...)
log.error(...)
log.fatal(...)
]]

function love.load()
  local drawPIE = false
  log.level = "trace"
  player.load()
  log.trace("hi")
end

function love.update(dt)
  pie:attach()
  player.control(dt)
  pie:detach()
end
function love.draw()
  log.trace("hi")
  pie:attach()
	player.draw()
  pie:detach()
  if drawPIE then
    pie:draw
    return
  end
end

function love.mousepressed(...)
 	pie:mousepressed(...)
end

function love.keypressed(key)
  pie:keypressed(key)
  if key == "f9" then
    drawPIE = true
end