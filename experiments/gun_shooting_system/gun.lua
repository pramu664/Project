gun = class{}

function gun:init()

  self.texture = love.graphics.newImage("gun.png")
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.x = VIRTUAL_WIDTH/2
  self.y = VIRTUAL_HEIGHT/2 

end

function gun:update()


  if love.mouse.isDown(1) then
    print("shoot a projectile")
  end

  mouse_x, mouse_y = love.mouse.getPosition()
  game_x, game_y = push:toGame(mouse_x, mouse_y)
  angle_to_mouse = math.atan2(game_y - VIRTUAL_HEIGHT/2, game_x - VIRTUAL_WIDTH/2)

end


function gun:render()

  love.graphics.translate(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)
  love.graphics.rotate(angle_to_mouse)
  love.graphics.draw(self.texture, -self.width/2, -self.height/2)

  
  love.graphics.line(0, 0, 20, 0)
  love.graphics.line(0, 0, 0, 20)
  love.graphics.line(0, 0, -20, 0)
  love.graphics.line(0, 0, 0, -20)

  --[[ 
  -- The coordinate system is now rotating.
  -- Any thing drawn in to the window is going to use that rotated coordinate system.
  --]]

end
