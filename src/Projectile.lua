Projectile = class{}

function Projectile:init(x, y, angle)

  self.rigidbody = particle:create(x or 0, y or 0, math.random(4, 8), angle or math.random(0, math.pi/2), 0.3)
  self.texture = love.graphics.newImage("graphics/donut.png")
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  self.bounce = -1

end


function Projectile:update()

  for i = #gEnemies, 1, -1 do
    if utils.rect_in_rect(self, gEnemies[i]) then

      thePlayer.currentProjectile = nil
      thePlayer.score = thePlayer.score + 1

      gEnemies[i].texture = gEnemyTransitionTexture
      gEnemies[i].texture = gEnemyDestroyParticles
      gSounds.projectileCollisionEnemy:play()
      table.remove(gEnemies, i)
      gCurrentEnemyCount = gCurrentEnemyCount - 1
      print("Player killed an enemy")
    end
  end

  self.x = self.rigidbody.x
  self.y = self.rigidbody.y

  self.rigidbody:update()


  if self.rigidbody.x > VIRTUAL_WIDTH then
    self.rigidbody.vx = self.rigidbody.vx * self.bounce
  elseif self.rigidbody.x < 0 then
      self.rigidbody.vx = self.rigidbody.vx * self.bounce
  elseif self.rigidbody.y > VIRTUAL_HEIGHT then
      self.rigidbody.vy = self.rigidbody.vy * self.bounce
  elseif self.rigidbody.y < 0 then
      self.rigidbody.vy = self.rigidbody.vy * self.bounce
  end

end

function Projectile:render()

  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)

end

