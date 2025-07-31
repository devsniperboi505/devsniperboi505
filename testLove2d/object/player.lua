local player = {
  x = 0,
  y = 0,
  xvel = 0,
  yvel = 0,
  sheetSH = 16,
  sheetSW = 16,
  sheetY = 0,
  sheetX = 0,
  speed = 3000,
  resize = 5,
  fri = 5.3,
  img = love.graphics.newImage('sprite/player.png'),
}

function player.load()
  -- script zone
end

function player.control(dt)
  -- Movement and physics updates go here
  player.x = player.x + player.xvel * dt
  player.xvel = player.xvel * (1 - math.min(dt * player.fri, 1))
  
  if love.keyboard.isDown('d') and player.xvel < 100 then
    player.xvel = player.xvel + player.speed * dt
  elseif love.keyboard.isDown('a') and player.xvel > -100 then
    player.xvel = player.xvel - player.speed * dt
  end
  return dt
end

function player.draw()
  -- Draw the player
  local sprite = love.graphics.newQuad(player.sheetX, player.sheetY, player.sheetSH, player.sheetSW, player.img:getDimensions())
  love.graphics.draw(player.img, sprite, player.x, player.y, 0, player.resize, player.resize)
end

return player