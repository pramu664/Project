Item = class{}

function Item:init(texture)

  self.texture = texture
  self.x = VIRTUAL_WIDTH/2
  self.y = VIRTUAL_HEIGHT/2
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()

end

function Item:update()

  if utils.rect_in_rect(self, thePlayer) then
    gIsPlayerPickupGun = true
    print("picked up the gun")
    donut = nil
    gSounds.itemPickup:play()
  end

end

function Item:render()
  love.graphics.draw(self.texture , VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)
end
