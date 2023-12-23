Player = class{}


function Player:init()

  self.texture = love.graphics.newImage("graphics/player.png")
  self.x = 0
  self.y = 0
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.speed = 1
  self.currentProjectile = Projectile(self.x, self.y)

end

function Player:update()

    if love.keyboard.isDown("left") then
      self.currentProjectile = Projectile(self.x, self.y, math.pi)
    end

    if love.keyboard.isDown("right") then
      self.currentProjectile = Projectile(self.x, self.y, 0)
    end

  if self.currentProjectile ~= nil then
    self.currentProjectile:update()
  end



  ---[[ new Player controller
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed
  end

  if love.keyboard.isDown("s") then
    self.y = self.y + self.speed
  end

  if love.keyboard.isDown("a") then
    self.x = self.x - self.speed
  end

  if love.keyboard.isDown("d") then
    self.x = self.x + self.speed
  end
  --]]

end


function Player:render()
  love.graphics.draw(self.texture, self.x, self.y)

  if self.currentProjectile ~= nil then
    self.currentProjectile:render()
  end

end



