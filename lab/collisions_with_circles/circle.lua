circle = class{}


function circle:init(x, y)

  self.texture = nil
  self.x = x or VIRTUAL_WIDTH/2
  self.y = y or VIRTUAL_HEIGHT/2
  self.radius = 10
  self.color = {0, 1, 0}
  self.colliders = {}

end

function circle:addToCollisionDetection(obj)
  table.insert(self.colliders, obj)
end


function circle:update()

  for _, collider in ipairs(self.colliders) do
    if self:isCollide(collider) then
      print("Yes")
      --[[ Do whatever you want here --]]
      -- Ex changing the color
      collider.color = {1, 0, 0}
    else
      print("No")
      collider.color = {0, 1, 0}
    end
  end

end


function circle:render()
  love.graphics.setColor(self.color)
  love.graphics.arc("fill", self.x, self.y, self.radius, 0, math.pi * 2)
end


function circle:isCollide(c)
  dx = self.x - c.x
  dy = self.y - c.y
  distance = math.sqrt(dx * dx + dy * dy)
  return distance < self.radius + c.radius
end

