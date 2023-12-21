Box = class{}

function Box:init(x, y, texture)
  self.texture = texture
  self.x = x
  self.y = y
  self.width = texture:getWidth()
  self.height = texture:getHeight()
end

function Box:render()
  love.graphics.draw(self.texture, self.x, self.y)
end
