vector = {_x=0, _y=0}

function vector:create(x, y)
  o = {}
  setmetatable(o, self)
  self.__index = self
  o._x = x
  o._y = y
  return o
end

function vector:set_x(value)
  self._x = value
end

function vector:set_y(value)
  self._y = value
end

function vector:get_x()
  return self._x
end

function vector:get_y()
  return self._y
end

function vector:set_angle(angle)
  magnitude = self:get_magnitude() 
  self._x = math.cos(angle) * magnitude
  self._y = math.sin(angle) * magnitude
end

function vector:set_magnitude(magnitude)
  angle = self:get_angle()
  self._x = math.cos(angle) * magnitude
  self._y = math.sin(angle) * magnitude
end

function vector:get_angle()
  return math.atan2(self._y, self._x) 
end

function vector:get_magnitude()
  return math.sqrt(self._x * self._x + self._y * self._y)
end

function vector:add(v2)
  return vector:create(self._x + v2:get_x(), self._y + v2:get_y())
end

function vector:multiply(value)
  return vector:create(self._x * value, self._y * value)
end

function vector:multiply_by(value)
  self._x = self._x * value
  self._y = self._y * value
end

function vector:subtract(v2)
  return vector:create(self._x - v2:get_x(), self._y - v2:get_y())
end

function vector:add_to(v2)
  self._x = self._x + v2:get_x()
  self._y = self._y + v2:get_y()
end

function vector:subtract_from(v2)
  self._x = self._x - v2:get_x()
  self._y = self._y - v2:get_y()
end

return vector
