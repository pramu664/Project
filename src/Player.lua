Player = Class{}

function Player:init()
  
  self.texture = love.graphics.newImage("graphics/player.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/2,
    VIRTUAL_HEIGHT/2,
    0,
    0
  )

end


function Player:update()

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
end
