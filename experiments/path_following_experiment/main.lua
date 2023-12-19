
particle = require("particle")

width = love.graphics.getWidth()
height = love.graphics.getHeight()

enemySpeed = 1
playerSpeed = 2
triggerRadius = 75

function love.load()

  player = particle:create(width/2, height/2, 0, 0)
  enemy = particle:create(width/4, height/4, enemySpeed, 0)

end

function love.update(dt)

  angle = enemy:angleTo(player)
  enemy.vx = math.cos(angle) * enemySpeed
  enemy.vy = math.sin(angle) * enemySpeed


  if love.keyboard.isDown("w") then
    player.y = player.y - playerSpeed
  end

  if love.keyboard.isDown("a") then
    player.x = player.x - playerSpeed
  end

  if love.keyboard.isDown("s") then
    player.y = player.y + playerSpeed
  end

  if love.keyboard.isDown("d") then
    player.x = player.x + playerSpeed
  end

  enemyColor = enemy:distanceTo(player) < triggerRadius and {1, 0, 0} or {0, 1, 0} 


  enemy:update()
end


function love.draw()

  -- Player
  love.graphics.setColor(0, 0, 1)
  love.graphics.arc("fill", player.x, player.y, 10, 0, math.pi * 2)

  -- Enemy
  love.graphics.setColor(enemyColor)
  love.graphics.arc("fill", enemy.x, enemy.y, 10, 0, math.pi * 2)
end
