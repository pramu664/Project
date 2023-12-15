enemy = Class{}

function enemy:init()
  self.texture = love.graphics.newImage("graphics/enemy.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/1.5,
    VIRTUAL_HEIGHT/1.5,
    0,
    0
  )
end

function enemy:update()

  angleToPlayer = self.rigidbody:angleTo(gPlayer.rigidbody)
  self.rigidbody.vx = math.cos(angleToPlayer) * ENEMY_SPEED
  self.rigidbody.vy = math.sin(angleToPlayer) * ENEMY_SPEED

  self.rigidbody:update()
  
end

function enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
