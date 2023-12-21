Enemy = class{}

function Enemy:init()

  self.rigidbody = particle:create(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 0)
  self.texture = love.graphics.newImage("graphics/enemy.png")

  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()

end

function Enemy:update()

  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
end

function Enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
