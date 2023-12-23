Enemy = Class{}

enemyState = {
  idle = false,
  chasing = false,
  attacking = false
}

local attackDstThreshold = 50

function Enemy:init()
  self.texture = love.graphics.newImage("graphics/enemy.png")
  self.rigidbody = particle:create(
    math.random(VIRTUAL_WIDTH, VIRTUAL_WIDTH + 20),
    math.random(0, VIRTUAL_HEIGHT),
    0,
    0
  )
  enemyState.chasing = true 

  ---[[ new 2
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  --]]

end

function Enemy:update()


  ---[[ new y
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  --]]

  distanceToPlayer = self.rigidbody:distanceTo(gPlayer.rigidbody)

  if distanceToPlayer < attackDstThreshold then

    self.rigidbody.vx = 0
    self.rigidbody.vy = 0
 
    enemyState.chasing = false 
    enemyState.attacking = true 

  else

    angleToPlayer = self.rigidbody:angleTo(gPlayer.rigidbody)
    self.rigidbody.vx = math.cos(angleToPlayer) * math.random(0.1, ENEMY_SPEED)
    self.rigidbody.vy = math.sin(angleToPlayer) * math.random(0.1, ENEMY_SPEED)

    enemyState.attacking = false

  end


  self.rigidbody:update()
  
end

function Enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)

  ---[[ new 5
  love.graphics.rectangle("line", self.rigidbody.x, self.rigidbody.y, self.width, self.height)
  --]]

end

