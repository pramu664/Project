
particle = {
  x = 0,
  y = 0,
  vx = 0, 
  vy = 0,
  mass = 1,
  radius = 0,
  bounce = -1,
  friction = 1,
  grav = 0,
  springs = nil,
  gravitations = nil,

}

function particle:create(x, y, speed, angle, grav)
  o = {}
  o.x = x
  o.y = y
  o.vx = math.cos(angle) * speed
  o.vy = math.sin(angle) * speed
  o.grav = grav or 0
  o.springs = {}
  o.gravitations = {}

  setmetatable(o, self)
  self.__index = self

  return o
end


function particle:handleGravitations()
  for _, particle in ipairs(self.gravitations) do
    self:gravitateTo(particle)
  end
end

function particle:handleSprings()
  for _, spring in ipairs(self.springs) do
    self:springTo(spring.point, spring.k, spring.length)
  end
end

function particle:removeGravitation(p)
  for i, gravitation in ipairs(self.gravitations) do
    if gravitation == p then
      table.remove(self.gravitations, i)
      return
    end
  end
end

function particle:addGravitation(p)
  self:removeGravitation(p)
  table.insert(self.gravitations, p)
end

function particle:removeSpring(point)
  for i, spring in ipairs(self.springs) do
    if spring.point == point then
      table.remove(self.springs, i)
      return
    end
  end
end

function particle:addSpring(point, k, length)
  self:removeSpring(point) -- new
  table.insert(self.springs, {
    point = point,
    k = k,
    length = length or 0
  })
end

function particle:springTo(p2, k, length)
  dx = p2.x - self.x
  dy = p2.y - self.y
  distance = math.sqrt(dx * dx + dy * dy)
  force = (distance - length or 0) * k
  ax = dx / distance * force
  ay = dy / distance * force
  self.vx = self.vx + ax
  self.vy = self.vy + ay
end


function particle:gravitateTo(p2)
  dx = p2.x - self.x
  dy = p2.y - self.y
  distSQ = dx * dx + dy * dy
  dist = math.sqrt(distSQ)
  force = p2.mass / distSQ
  ax = dx / dist * force
  ay = dy / dist * force
  self.vx = self.vx + ax
  self.vy = self.vy + ay
end

function particle:distanceTo(p2)
  dx = p2.x - self.x
  dy = p2.y - self.y
  return math.sqrt(dx * dx + dy * dy)
end

function particle:angleTo(p2)
  return math.atan2(p2.y - self.y, p2.x - self.x)
end

function particle:accelerate(ax, ay)
  self.vx = self.vx + ax
  self.vy = self.vy + ay
end


function particle:update()
  self:handleSprings()
  self:handleGravitations()
  self.vx = self.vx * self.friction
  self.vy = self.vy * self.friction
  self.vy = self.vy + self.grav
  self.x = self.x + self.vx
  self.y = self.y + self.vy
end


return particle
