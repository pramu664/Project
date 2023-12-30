Item = class{}

function Item:init(texture)

  self.texture = texture
  self.x = math.random(50, VIRTUAL_WIDTH/2)
  self.y = math.random(50, VIRTUAL_HEIGHT/2)
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.rigidbody = particle:create(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 0, 0.09)
  self.rigidbody:addSpring({x = self.rigidbody.x + 10, y = self.rigidbody.y}, 0.5, 10)

end

function Item:update()

  self.rigidbody:update()
  self.x = self.rigidbody.x
  self.y = self.rigidbody.y

  if utils.rect_in_rect(self, thePlayer) then
    gIsPlayerPickupGun = true
    thePlayer.tookPower = true
    thePlayer.speed = 1.2
    print("picked up the gun")
    donut = nil
    gSounds.itemPickup:play()
  end

end

function Item:render()
  love.graphics.draw(self.texture , self.rigidbody.x, self.rigidbody.y)
end
