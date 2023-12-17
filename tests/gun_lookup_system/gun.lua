gun = class{}

function gun:init()
  self.texture = love.graphics.newImage("gun.png")
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
end

function gun:update()

  mouseX, mouseY = love.mouse.getPosition()
  gameX, gameY = push:toGame(mouseX, mouseY)
  angle = math.atan2(gameY - VIRTUAL_HEIGHT/2, gameX - VIRTUAL_WIDTH/2)

end

function gun:render()
  love.graphics.translate(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)
  love.graphics.rotate(angle)
  love.graphics.draw(self.texture, -self.width/2, -self.height/2)
end
