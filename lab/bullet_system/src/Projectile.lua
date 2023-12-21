Projectile = class{}

function Projectile:init(x, y)
  self.rigidbody = particle:create(x or 0, y or 0, 8, math.random()  * 2 * math.pi, 0.3)
  self.texture = love.graphics.newImage("graphics/bullet.png")
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.bounce = -1
end


function Projectile:update()

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

