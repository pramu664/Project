Dog = Class{}

function Dog:init()
  self.texture = love.graphics.newImage("graphics/Dog.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/4,
    VIRTUAL_HEIGHT/2,
    0,
    0,
    0.01
  )
  self.rigidbody:addSpring(gPlayer.rigidbody, 0.5, 20)
  self.rigidbody.friction = 0.9
end

function Dog:update()
  self.rigidbody:update()
end


function Dog:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
