--[[
-- IDEAS (WHAT IDEAS I CAN IMPLEMENT RIGHT NOW ?)
--
-- Giving a signal for player for enemy instantiation position before enemy instantiate.
-- Make the enemy stop in radius of distance
-- Lunge attack
-- Enemy instantiate outside of the window
--
--]]

enemy = Class{}

-- new
enemyState = {
  idle = false,
  chasing = false,
  attacking = false
}

local attackDstThreshold = 50

function enemy:init()
  self.texture = love.graphics.newImage("graphics/enemy.png")
  self.rigidbody = particle:create(
    math.random(VIRTUAL_WIDTH, VIRTUAL_WIDTH + 20),
    math.random(0, VIRTUAL_HEIGHT),
    0,
    0
  )
  enemyState.chasing = true -- new
end

function enemy:update()

  -- new
  distanceToPlayer = self.rigidbody:distanceTo(gPlayer.rigidbody)

  -- new
  if distanceToPlayer < attackDstThreshold then

    self.rigidbody.vx = 0
    self.rigidbody.vy = 0
 
    enemyState.chasing = false -- new
    enemyState.attacking = true -- new

  else

    angleToPlayer = self.rigidbody:angleTo(gPlayer.rigidbody)
    self.rigidbody.vx = math.cos(angleToPlayer) * math.random(0.1, ENEMY_SPEED)
    self.rigidbody.vy = math.sin(angleToPlayer) * math.random(0.1, ENEMY_SPEED)

    enemyState.attacking = false --  new

  end
  --]]


  self.rigidbody:update()
  
end

function enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end

