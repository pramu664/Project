Player = class{}


function Player:init()

  self.texture = love.graphics.newImage("graphics/player.png")
  self.textureTwo = love.graphics.newImage("graphics/player_2.png")
  self.texturePowerRight = love.graphics.newImage("graphics/player_with_power_right.png")
  self.texturePowerLeft = love.graphics.newImage("graphics/player_with_power_left.png")
  self.x = 0
  self.y = 0
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.speed = 1
  self.currentProjectile = nil
  self.score = 0
  self.tookPower = false

end


function Player:update()


 
  if self.x + self.width > VIRTUAL_WIDTH  then
    self.x = VIRTUAL_WIDTH - self.width
  end
  
  if self.y + self.height > VIRTUAL_HEIGHT then
    self.y = VIRTUAL_HEIGHT - self.height
  end

  if self.x < 0 then 
    self.x = 0
  end

  if self.y < 0 then
    self.y = 0
  end

  if gIsPlayerPickupGun then
    if love.keyboard.isDown("left") then
      self.currentProjectile = Projectile(self.x, self.y, math.pi)
      gSounds.projectileInstantiation:play()
    end

    if love.keyboard.isDown("right") then
      self.currentProjectile = Projectile(self.x, self.y, 0)

      gSounds.projectileInstantiation:play()
    end

    if self.currentProjectile ~= nil then
      self.currentProjectile:update()
    end
  end



  ---[[ new Player controller
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed
    gSounds["walk"]:play()
  end

  if love.keyboard.isDown("s") then
    self.y = self.y + self.speed
    gSounds["walk"]:play()
  end

  if love.keyboard.isDown("a") then
    self.x = self.x - self.speed
    gSounds["walk"]:play()
  end

  if love.keyboard.isDown("d") then
    self.x = self.x + self.speed
    gSounds["walk"]:play()
  end
  --]]

end


function Player:render()

  if self.currentProjectile ~= nil then
    self.currentProjectile:render()
  end

 ---[[
  if self.x > VIRTUAL_WIDTH/2 then
    love.graphics.draw(self.textureTwo, self.x, self.y)
  else
    love.graphics.draw(self.texture, self.x, self.y)
  end
  --]]

  if self.tookPower then
    if self.x > VIRTUAL_WIDTH/2 then
      love.graphics.draw(self.texturePowerLeft, self.x, self.y)
    else
      love.graphics.draw(self.texturePowerRight, self.x, self.y)
    end
  end

end



