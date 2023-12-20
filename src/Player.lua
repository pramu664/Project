Player = Class{}

function Player:init()
  
  self.texture = love.graphics.newImage("graphics/player.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/2,
    VIRTUAL_HEIGHT/2,
    0,
    0
  )

  ---[[ new 1
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  --]]

end


function Player:update()

  ---[[ new 6
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  --]]

  if love.keyboard.isDown("w") then
    self.rigidbody.y = self.rigidbody.y - PLAYER_SPEED
  end

  if love.keyboard.isDown("a") then
    self.rigidbody.x = self.rigidbody.x - PLAYER_SPEED
  end

  if love.keyboard.isDown("s") then
    self.rigidbody.y = self.rigidbody.y + PLAYER_SPEED
  end

  if love.keyboard.isDown("d") then
    self.rigidbody.x = self.rigidbody.x + PLAYER_SPEED
  end

end

function Player:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)

  ---[[ new 4
  love.graphics.setColor({1, 0, 0})
  love.graphics.rectangle("line", self.rigidbody.x, self.rigidbody.y, self.width, self.height)
  --]]

end
