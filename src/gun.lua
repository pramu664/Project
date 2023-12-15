gun = Class{}


function gun:init()
  self.texture = love.graphics.newImage("graphics/gun.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/1.5,
    VIRTUAL_HEIGHT/3,
    0,
    0
  )
  self.springPoint = {
    x = self.rigidbody.x + 10,
    y = self.rigidbody.y + 10
  }

  self.rigidbody:addSpring(self.springPoint, 0.05, 20)
  -- self.rigidbody.friction = 0.9
end


function gun:update()
  self.rigidbody:update()
end


function gun:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
