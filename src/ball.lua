ball = Class{}

function ball:init()
  self.texture = love.graphics.newImage("graphics/ball.png")
  self.rigidbody = particle:create(
    VIRTUAL_WIDTH/4,
    VIRTUAL_HEIGHT/2,
    0,
    0
  )
  self.rigidbody:addSpring(gPlayer.rigidbody, 0.001, 3)
end

function ball:update()
 
  self.rigidbody:update()

end


function ball:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
