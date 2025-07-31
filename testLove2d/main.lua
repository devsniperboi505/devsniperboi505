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
  -- Log to a file
  log.outfile = "log.txt"
  player.load()
  log.info('welcome to game engine love2d lightweight framework lua game engine if you want this log sytle go to https://github.com/rxi/log.lua and download')
  log.dedug('yogurt')
end

-- Custom output function
log.out = function(str)
  -- Custom handling of log string
  my_custom_log_handler(str)
end

function love.update(dt)
  pie:attach()
  player.control(dt)
  pie:detach()
end
function love.draw()
  pie:attach()
	player.draw()
  pie:detach()
    if pieChartVisible then
        drawPieChart() -- This is the crucial part: draw ONLY if visible
    end
end

function love.mousepressed(...)
 	pie:mousepressed(...)
end

local pieChartVisible = false

function love.keypressed(key)
  pie:keypressed(key)
    if key == "f9" then
        pieChartVisible = not pieChartVisible
    end
end

local function drawPieChart()
  pie:draw()
end
