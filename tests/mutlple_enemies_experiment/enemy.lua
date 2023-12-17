enemy = class{}

function enemy:init()
  self.texture = love.graphics.newImage("enemy.png")
  self.rigidbody = particle:create(virtual_width/2, virtual_height/2, 1, math.random() * math.pi * 2)
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
end

function enemy:update()
  self.rigidbody:update()

  if self.rigidbody.y > virtual_height then
    self.rigidbody.vy = self.rigidbody.vy * self.rigidbody.bounce 
  end

  if self.rigidbody.y < 0 then
    self.rigidbody.vy = self.rigidbody.vy * self.rigidbody.bounce 
  end

  if self.rigidbody.x < 0 then
    self.rigidbody.vx = self.rigidbody.vx * self.rigidbody.bounce 
  end

  if self.rigidbody.x > virtual_width then
    self.rigidbody.vx = self.rigidbody.vx * self.rigidbody.bounce 
  end
end

function enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
